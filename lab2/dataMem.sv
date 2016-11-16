
module dataMem(
  input         clock,
                enableWrite,
   input [7:0]  address,
   input [7:0]  dataIn,
	output [7:0] dataOut);
	 	 
	logic [7:0]  mem [255:0];
	 
initial 
	//$readmemb("data.list", mem);
	 
	 
always_comb
	begin
		dataOut = mem[address];
		//$display("Memory read M[%d] = %d",DataAddress,DataOut);
	end;

always @ (posedge clock)
	if(enableWrite) begin
		mem[DataAddress] = dataIn;
		//$display("Memory write M[%d] = %d",DataAddress,DataIn);
	end
 
	 
endmodule
