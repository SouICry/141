// Engineer: 
// 
// Create Date:    13:24:09 10/17/2016 
// Design Name: 
// Module Name:    reg_file 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 					  $clog2

module regFile (
  input         clock,
                enableWrite,
  input  [ 2:0] registerA,
                registerB,
                registerWrite,
  input  [ 7:0] dataIn,
  output [ 7:0] regA,
  output [ 7:0] regB
    );

logic [7:0] registers[8];

assign regA = registerA? registers[registerA] : 0;
assign regB = registerB? registers[registerB] : 0;

// sequential (clocked) writes
always_ff @ (posedge clock)
  if (enableWrite && registerWrite)
    registers[registerWrite] <= dataIn;

endmodule
