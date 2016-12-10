
module dataMem(
   input        clock,
                enableWrite,
   input [7:0]  address,
   input [7:0]  dataIn,
	output [7:0] dataOut,
   input 	 	 memOffsetWrite,
   input [6:0]  memOffsetIn
);
	 	 
logic [7:0] mem [255:0];
logic [6:0] offsetVal;
	 
initial
	begin
		$readmemb("data.list", mem);
		offsetVal = 7'd0;
	end
	 
assign dataOut = mem[address + offsetVal];
assign memOffset = offsetVal;

always @ (posedge clock) begin
	if(enableWrite) begin
		$display("mem[%d] = %d",address + offsetVal, dataIn);
		mem[address + offsetVal] <= dataIn;
	end
	if (memOffsetWrite)
		offsetVal <= memOffsetIn;
		//$display("Memory write M[%d] = %d",DataAddress,DataIn);
	end
 
	 
endmodule
