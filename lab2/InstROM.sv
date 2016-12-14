
module InstROM(
    input [6:0] InstAddress,
    output [8:0] InstOut);
	 	 
	 logic [8:0] mem [127:0];
	 
	 initial
	 begin 
        $readmemb("instructionMem3.list", mem);
        //$readmemb("instructionMem2.list", mem);
        //$readmemb("instructionMem3.list", mem);
		  
	 end
	 assign InstOut = mem[InstAddress];
endmodule
