module InstROM_test;
// DUT Input Drivers
	bit [6:0] InstAddress;
   bit [8:0] InstOut;


// Instantiate the Unit Under Test (UUT)

	InstROM test(
	  .InstAddress(InstAddress),
	  .InstOut(InstOut)
	);

	initial begin
		InstAddress = 7'h02;
	  
	end
    
endmodule

