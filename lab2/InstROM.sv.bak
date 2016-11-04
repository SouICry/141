//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 	Leo Porter
// 
// Create Date:    15:50:22 11/02/2007 
// Design Name: 
// Module Name:    InstROM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This is a basic verilog module to behave as an instruction ROM
// 				 template.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module InstROM(
    input [6:0] InstAddress,
    output [8:0] InstOut);
	 	 
	 logic [8:0] mem [127:0];
	 
	 assign InstOut = mem[InstAddress];
	 
	 initial 
        $readmemh("dataram_init.list", mem);
		  
endmodule
