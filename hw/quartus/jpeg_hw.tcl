# TCL File Generated by Component Editor 20.1
# Sat Apr 03 07:21:06 UTC 2021
# DO NOT MODIFY


# 
# jpeg "jpeg" v1.0
#  2021.04.03.07:21:06
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module jpeg
# 
set_module_property DESCRIPTION ""
set_module_property NAME jpeg
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME jpeg
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL jpeg
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file jpeg.sv SYSTEM_VERILOG PATH ../../rtl/jpeg.sv TOP_LEVEL_FILE


# 
# parameters
# 


# 
# module assignments
# 
set_module_assignment embeddedsw.dts.group jpeg
set_module_assignment embeddedsw.dts.name jpeg_enc
set_module_assignment embeddedsw.dts.vendor team4


# 
# display items
# 


# 
# connection point slave
# 
add_interface slave avalon end
set_interface_property slave addressUnits WORDS
set_interface_property slave associatedClock clock_1
set_interface_property slave associatedReset reset_sink
set_interface_property slave bitsPerSymbol 8
set_interface_property slave burstOnBurstBoundariesOnly true
set_interface_property slave burstcountUnits WORDS
set_interface_property slave explicitAddressSpan 0
set_interface_property slave holdTime 0
set_interface_property slave linewrapBursts true
set_interface_property slave maximumPendingReadTransactions 0
set_interface_property slave maximumPendingWriteTransactions 0
set_interface_property slave readLatency 0
set_interface_property slave readWaitTime 1
set_interface_property slave setupTime 0
set_interface_property slave timingUnits Cycles
set_interface_property slave writeWaitTime 0
set_interface_property slave ENABLED true
set_interface_property slave EXPORT_OF ""
set_interface_property slave PORT_NAME_MAP ""
set_interface_property slave CMSIS_SVD_VARIABLES ""
set_interface_property slave SVD_ADDRESS_GROUP ""

add_interface_port slave s_address address Input 1
add_interface_port slave s_read read Input 1
add_interface_port slave s_write write Input 1
add_interface_port slave s_readdata readdata Output 32
add_interface_port slave s_writedata writedata Input 32
set_interface_assignment slave embeddedsw.configuration.isFlash 0
set_interface_assignment slave embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment slave embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment slave embeddedsw.configuration.isPrintableDevice 0


# 
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock_1
set_interface_property reset_sink synchronousEdges DEASSERT
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""

add_interface_port reset_sink rst reset Input 1


# 
# connection point clock_1
# 
add_interface clock_1 clock end
set_interface_property clock_1 clockRate 25000000
set_interface_property clock_1 ENABLED true
set_interface_property clock_1 EXPORT_OF ""
set_interface_property clock_1 PORT_NAME_MAP ""
set_interface_property clock_1 CMSIS_SVD_VARIABLES ""
set_interface_property clock_1 SVD_ADDRESS_GROUP ""

add_interface_port clock_1 clk clk Input 1
