set_property SRC_FILE_INFO {cfile:/mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/hdmi_out_test/hdmi_out_test.srcs/sources_1/ip/clk_wiz_hdmi/clk_wiz_hdmi.xdc rfile:../../../hdmi_out_test.srcs/sources_1/ip/clk_wiz_hdmi/clk_wiz_hdmi.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.08
