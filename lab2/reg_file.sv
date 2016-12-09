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

module reg_file (
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

initial begin
registers = {0, 0, 0, 0, 0, 0, 0, 0};
end

assign regA = registers[registerA];
assign regB = registers[registerB];

// sequential (clocked) writes
always_ff @ (posedge clock)
	begin 
		if (enableWrite)
			registers[registerWrite] <= dataIn;
	end 

endmodule
