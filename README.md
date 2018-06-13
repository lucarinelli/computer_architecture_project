# Computer Architecture Project
This is the git repository containing most of the work done by Andrea Fanti and Luca Rinelli for the Computer Architecture course project. We are using a PYNQ-Z1 by Digilent, based on the Xilinx Zynq-7000.

## "Real-time" edge detection (HDMI/DVI passthrough) 
The goal is to take the stream from the HDMI IN, retransmit it on the HDMI OUT in real time and at the same time perform the edge detection using Sobel operator, the result of the edge detection are showed on the frame immediately after the one on which it is computed. See the folder __dvi_edge_detector__.
* Missing for testing: component to read the memory and decide what to stream in output.

## Sub projects index
Look for a readme file inside the project folders to more detailed explanation
* __hdmi_out_test__, simple hdmi out test with colors (and an easter egg!)
* __test_hdmi_filter__, simple negative filter on an hdmi input that is then transmitted in output real-time
* others... not all working or completed!

# Generic guide to program the board (to be moved probably)

**note:**
The steps illustrated here are specific for the Digilent PYNQ-Z1 board.  
They still may be useful for other boards too

* * *

## BUTTONS
* PROG (Program Push Switch): resets the PL and shuts down the DONE led
* SRST (System Reset): resets the zynq device (CPU, RAM & PL) without affecting
  the debug environment (for instance, the breakpoints remain unchanged)

## DICTIONARY
* PL = Programmable Logic (the part similar to a "normal" FPGA)
* PS = Processing System (ARM CPU, RAM & other cool things)

## GENERATE & LOAD a .bit FILE ON ISE
1. make a new project with:  
	family:	zynq-7000  
	part:		xc7z020  
	package:	clg400  
	speed:		-1  
	use the xc7z020-1-clg400 for the pynq-z1 board  
	all these info are printed directly on the chip
2. write the program (or use the schematic editor)
3. add a new source file (Implementation Contraints File) (extension .ucf)
	* write ` NET "X" LOC "PIN" ` to map the I/O net to the pin PIN on the board
	  (read the refence guide to know the pin names as seen on the chip)
	* some pins have a 1.8V input/output, others have 3.3V. This has to be
	  specified using ` IOSTANDARD = LVCMOS18 ` (this for 1.8V)
4. on the Design tab select the main file select Implement Design below
5. if no errors, you can do Generate Programming File
6. load the .bit file using Xilinx SDK from Vivado
	(in the menu: Xilinx/program FPGA/)
	* you can try selecting the device to see if the board has been recognized)
	* Vivado can also be directly used
7. when the file has been loaded, the DONE led (LD12) lights up on the board

> *note* that for all this only the microUSB cable is needed

> *note* also that every configuration is lost when the board is powered down

## GENERATE & LOAD A .bit FILE ON Vivado IDE
The steps are very similar to the ones for ISE.
The difference is that
* you have to write the program using VHDL (bye bye .sch !)
* the constraints file is in .xdc format
	* more difficult (and long) syntax
	* easier to uncomment and modify lines from the so-called [master XDC file][1]
	  of this specific board

## BOOT
the boot mode is selected by the jumper JP4
(shorting 2 pins directly on the board, upper-left corner)
* SD: boot from microSD
* QSPI: probably not useful
* JTAG: processor waits for a software to be loaded by an host PC using Xilinx
  tools
	- this can also be used to program without the use of the processor.
	  the problem is that changes are not persistent

JP5 controls from where the power arrives (microUSB or J18)

#### PROBLEMS ####
* connecting to the `jupyter_notebooks` via firefox doesn't work (as of 05/2018),
  use chrome
* the chip become very hot when booted in SD mode (the CPU works a lot)
	- a non-electrically-conductive dissipator can be used to solve this

[1]: https://reference.digilentinc.com/_media/reference/programmable-logic/pynq-z1/pynq-z1_c.zip
	"pynq-z1 master xdc file"


<!--
sets the tab width to 4 spaces
vim: tabstop=4 shiftwidth=4
-->
