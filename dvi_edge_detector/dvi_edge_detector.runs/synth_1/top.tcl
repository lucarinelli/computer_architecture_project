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
create_project -in_memory -part xc7z020clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.cache/wt [current_project]
set_property parent.project_path /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/dvi2rgb_v1_7/src/DVI_Constants.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/rgb2dvi_v1_2/src/DVI_Constants.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/dvi2rgb_v1_7/src/ChannelBond.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/rgb2dvi_v1_2/src/ClockGen.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/rgb2dvi_v1_2/src/SyncAsync.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/dvi2rgb_v1_7/src/GlitchFilter.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/dvi2rgb_v1_7/src/TWI_SlaveCtl.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/dvi2rgb_v1_7/src/EEPROM_8b.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/dvi2rgb_v1_7/src/InputSERDES.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/rgb2dvi_v1_2/src/OutputSERDES.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/dvi2rgb_v1_7/src/PhaseAlign.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/dvi2rgb_v1_7/src/ResyncToBUFG.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/rgb2dvi_v1_2/src/SyncAsyncReset.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/dvi2rgb_v1_7/src/SyncBase.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/dvi2rgb_v1_7/src/TMDS_Clocking.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/dvi2rgb_v1_7/src/TMDS_Decoder.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/rgb2dvi_v1_2/src/TMDS_Encoder.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/dvi2rgb_v1_7/src/dvi2rgb.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/rgb2dvi_v1_2/src/rgb2dvi.vhd
  /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/new/top.vhd
}
read_vhdl -library myram /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/new/loader.vhd
read_vhdl -library mydvi /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/new/merge_v2.vhd
read_ip -quiet /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/ip/block_ram/block_ram.xci
set_property used_in_implementation false [get_files -all /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/ip/block_ram/block_ram_ooc.xdc]

read_ip -quiet /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/ip/clk_wiz/clk_wiz.xci
set_property used_in_implementation false [get_files -all /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/ip/clk_wiz/clk_wiz_board.xdc]
set_property used_in_implementation false [get_files -all /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/ip/clk_wiz/clk_wiz.xdc]
set_property used_in_implementation false [get_files -all /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/ip/clk_wiz/clk_wiz_late.xdc]
set_property used_in_implementation false [get_files -all /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/ip/clk_wiz/clk_wiz_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/constrs_1/imports/docs/PYNQ-Z1_C.xdc
set_property used_in_implementation false [get_files /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/constrs_1/imports/docs/PYNQ-Z1_C.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top top -part xc7z020clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
