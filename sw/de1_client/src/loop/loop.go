// The main loop.
package loop

import (
	"context"
	"log"
	"time"

	pb "github.com/CPEN391-Team-4/backend/pb/proto"
	"github.com/CPEN391-Team-4/hardware/sw/de1_client/src/camera"
	"github.com/CPEN391-Team-4/hardware/sw/de1_client/src/devid"
)

// How frequently to check for faces, when there's motion.
const verifyTime = 2 * time.Second

// A request to start/stop streaming, or to assert that motion is
// present.
type LoopReq = int

// How long to wake up for, when we detect motion.
const motionTime = 4 * time.Second

const (
	StartStreamReq = iota
	StopStreamReq  = iota
	MotionReq      = iota
	QuitReq        = iota
)

// We loop around here the entire time, monitoring for motion/requests
// to stream.  We do it this way to simplify interleaving
// verifying/unlocking the door when motion is detected, and when we
// just want to stream.
func CaptureLoop(client pb.RouteClient, vidClient pb.VideoRouteClient,
	reqs chan LoopReq, streamState chan bool, finished chan struct{}) {
	frameTicker := time.NewTicker(time.Second / camera.CameraFPS)
	// frameTicker := time.NewTicker(1 * time.Second)
	verifyTicker := time.NewTicker(verifyTime)
	motionTimer := time.NewTimer(0)

	frameNum := 0

	var streaming bool
	var motion bool

	var err error
	var stream pb.VideoRoute_StreamVideoClient

	camera.Open()
	defer camera.Close()

	var buf []byte

	// Every time we react to a request to stream, we call this.
	// It checks to see if the stream is already going, and
	// starts/stops it accordingly.
	startStopStream := func() {
		if !streaming && stream != nil {
			log.Println("stopped streaming")
			camera.Stop()
			stream.CloseAndRecv()
			stream = nil
		} else if streaming && stream == nil {
			log.Println("started streaming")
			camera.Start()
			frameNum = 0
			stream, err = vidClient.StreamVideo(context.Background())
			if err != nil {
				log.Println("failed to start streaming ", err)
				return
			}

			err = stream.Send(&pb.Video{DeviceId: devid.DeviceID})
			if err != nil {
				log.Println("failed to send devid")
				return
			}

			streamState <- true
		}
	}

loop:
	for {
		select {
		case req := <-reqs:
			switch req {
			case StartStreamReq:
				if streaming {
					log.Println("tried to start streaming when already streaming")
				} else {
					streaming = true
					startStopStream()
				}

			case StopStreamReq:
				if !streaming {
					log.Println("tried to stop streaming when not streaming")
				} else if !motion {
					streaming = false
					startStopStream()
					streamState <- false
				}

			case MotionReq:
				log.Println("motion detected")
				motion = true
				motionTimer.Reset(motionTime)

			case QuitReq:
				motion = false
				streaming = false
				startStopStream()
				break loop
			}

		case <-motionTimer.C:
			log.Println("motion expired")
			motion = false

		case <-frameTicker.C:
			if streaming {
				buf, err = camera.Capture()
				if err != nil {
					log.Println("failed to capture a frame ", err)
					continue
				}

				frame := pb.Video{
					Frame: &pb.Frame{
						Number:    int32(frameNum),
						LastChunk: true,
						Chunk:     buf,
					},
				}

				err = stream.Send(&frame)
				if err != nil {
					log.Println("failed to send a frame ", err)
					continue
				}

				frameNum++
			}

		case <-verifyTicker.C:
			if motion {
				log.Println("checking for faces in the frame")
				camera.Start()
				// First image has artifacts.
				camera.Capture()
				buf, err = camera.Capture()
				camera.Stop()
				if err != nil {
					log.Println("failed to capture a frame ", err)
					continue
				}

				faceStream, err := client.VerifyUserFace(context.Background())
				if err != nil {
					log.Println("failed to start face verify stream ", err)
					continue
				}

				err = faceStream.Send(&pb.FaceVerificationReq{
					Photo: &pb.Photo{
						Image:         buf,
						FileExtension: "jpg",
					},
				})
				if err != nil {
					log.Println("couldn't send photo for face verification ", err)
					continue
				}

				resp, err := faceStream.CloseAndRecv()
				if err != nil {
					log.Println("didn't close face verify stream properly ", err)
					continue
				}

				log.Printf("trusted: %v, user: %s, confidence: %f",
					resp.Accept, resp.User, resp.Confidence)
			}
		}
	}

	finished <- struct{}{}
}

func MonitorRequests(client pb.RouteClient, vidClient pb.VideoRouteClient,
	loopReqs chan LoopReq, streamState chan bool) {
	lockStream, err := client.RequestToLock(context.Background())
	if err != nil {
		panic(err)
	}

	requestStream, err := vidClient.RequestToStream(context.Background())
	if err != nil {
		panic(err)
	}

	go func() {
		for {
			lockreq, err := lockStream.Recv()
			if err != nil {
				panic(err)
			}

			lockStream.Send(&pb.LockConnection{Setup: true})

			log.Println("locked: ", lockreq.Request)
		}
	}()

	go func() {
		for {
			streamReq, err := requestStream.Recv()
			if err != nil {
				panic(err)
			}

			if streamReq.Request {
				loopReqs <- StartStreamReq
			} else {
				loopReqs <- StopStreamReq
			}

			// time.Sleep(100 * time.Millisecond)
			state := <-streamState
			if state {
				requestStream.Send(&pb.InitialConnection{
					Setup: state,
				})
			}
			// log.Println("send stream state ", state)
		}
	}()
}
