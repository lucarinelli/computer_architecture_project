## This file is a general .xdc for the PYNQ-Z1 board Rev. C
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal 125 MHz

set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports sys_clk]

##LEDs

set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {led[1]}]


create_clock -period 8.000 -name sys_clk_pin -waveform {0.000 4.000} -add [get_ports sys_clk]
create_clock -period 371.250 -name VIRTUAL_cd_poorly/clk_o_reg_0 -waveform {0.000 185.625}
