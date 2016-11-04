// Company: 
// Engineer:
//
// Create Date:   13:31:49 10/27/2011
// Design Name:   reg_file
// Module Name:   reg_file_tb.v
// Project Name:  lab_basics
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_file
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////

module reg_file_tb;
// DUT Input Drivers
	bit       CLK;	      // bit can be only 0, 1 (no x or z)
   bit       RegWrite;   // bit self-initializes to 0, not x (handy)
	bit		 flag;
	logic		 flagBit;
	bit [2:0] srcA,
	          srcB,
             writeReg;
	bit [7:0] writeValue;

// DUT Outputs
	wire [7:0] ReadA,
              ReadB;

// Instantiate the Unit Under Test (UUT)

	reg_file test(
	  .clock(CLK),
	  .enableWrite(RegWrite),
	  .registerA(srcA),
	  .registerB(srcB), 
	  .registerWrite(writeReg),
	  .dataIn(writeValue),
	  .flag(flag),
	  .regA(ReadA),
	  .regB(ReadB),
	  .flagBit(flagBit)
	);

	initial begin
		#20ns;
	  writeReg   =  3'b001;
	  writeValue =  8'hCA;
	  RegWrite   =  1;
		
	  #20ns;
	  
	  srcA = 3'b001;
	  #20ns;
	  

	  RegWrite   =  0;
	  writeReg   =  3'b100;
	  writeValue =  8'h56;
	  srcA       =  3'b100;
	  srcB 		 = 3'b001;
	  #20ns;
	  
	  flag = 0'b1;
	  #20ns;
	  flag = 0'b0;
	  #20ns;
	  
	  $stop;
	  
	end
always begin
  #10ns CLK = 1;
  #10ns CLK = 0;
end      
endmodule

