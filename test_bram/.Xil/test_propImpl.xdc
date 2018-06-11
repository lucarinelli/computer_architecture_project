set_property SRC_FILE_INFO {cfile:c:/Users/rinel/Desktop/computer_architecture_project/test_bram/test_bram.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc rfile:../test_bram.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc id:1 order:EARLY scoped_inst:cw/inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports sysclk]] 0.08
