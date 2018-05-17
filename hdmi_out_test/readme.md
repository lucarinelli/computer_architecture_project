# hdmi_out_test
VHDL code to realize and test an HDMI transmitter on a PYNQ Z1 board using
Xilinx Vivado WebPack.

Simple example changing color on the screen using the switches on the board.

## State
* __WORKING__
* Actually DVI mode
* (Rewriting transmitter correcting errors and hopefully making it easier to use)
* (Also working to make it easy to switch between DVI and HDMI mode)
* Probably we do __NOT__ need to add that i2c bus for control in HDMI mode
* The monitor has been capable of powering the board in some situations!
  Further investigation needed

## Resources
* [HDMI 1.3a specifications](https://www.hdmi.org/manufacturer/specification.aspx)
* [DVI 1.0 specifications](https://web.archive.org/web/20120717013308/http://www.ddwg.org/lib/dvi_10.pdf)
