# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7z020clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.cache/wt [current_project]
set_property parent.project_path C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/DVI_Constants.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/rgb2dvi_v1_2/src/DVI_Constants.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/ChannelBond.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/rgb2dvi_v1_2/src/ClockGen.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/SyncAsync.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/rgb2dvi_v1_2/src/SyncAsync.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/GlitchFilter.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/TWI_SlaveCtl.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/EEPROM_8b.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/InputSERDES.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/rgb2dvi_v1_2/src/OutputSERDES.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/PhaseAlign.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/ResyncToBUFG.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/SyncAsyncReset.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/rgb2dvi_v1_2/src/SyncAsyncReset.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/SyncBase.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/TMDS_Clocking.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/TMDS_Decoder.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/rgb2dvi_v1_2/src/TMDS_Encoder.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/dvi2rgb_v1_7/src/dvi2rgb.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/imports/Desktop/rgb2dvi_v1_2/src/rgb2dvi.vhd
  C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/new/pass_through.vhd
}
read_ip -quiet C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all c:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/constrs_1/imports/docs/PYNQ-Z1_C.xdc
set_property used_in_implementation false [get_files C:/Users/rinel/Desktop/computer_architecture_project/test_hdmi_filter/test_hdmi_filter.srcs/constrs_1/imports/docs/PYNQ-Z1_C.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top pass_through -part xc7z020clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef pass_through.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file pass_through_utilization_synth.rpt -pb pass_through_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
