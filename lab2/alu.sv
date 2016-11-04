import definitions::*;
module alu(
  input [3:0] operation,
  input [7:0] A,
  input [7:0] B,
  input flagIn,
  output logic [7:0] out,
  output logic flag
    
);
logic signed [7:0] A_S;
logic signed [7:0] B_S;
	
  always_comb 
  begin
  A_S = 8'bX;
  B_S = 8'bX;
  out = 8'bX;
  flag = flagIn;
  
  case(operation)
	  doNothing: out = A;
	  absDiff: 
	  begin
		A_S = A;
		B_S = B;
		out = A_S > B_S ? A_S - B_S : B_S - A_S;
	  end
	  LSR1: out = A >> 1;
	  oneLSL: out = 8'd1 << A;
	  oneLSLMinus1: out = (8'd1 << A) - 8'd1;
	  strMatch: 
		  begin
			flag = 
				!((A[3:0]^B[3:0]) &&
				(A[3:0]^B[4:1]) &&
				(A[3:0]^B[5:2]) &&
				(A[3:0]^B[6:3]) &&
				(A[3:0]^B[7:4]));
		  end
	  addu: {flag, out} = A + B;
	  incrementIfSet: out = A + flagIn;
	  setNegative: flag = A[7];
	  LSL1: {flag,out} = (A << 1) & flagIn;
	  min: out = A < B ? A : B;
	  decrementSetZero: 
		  begin
			out = A - 8'd1;
			flag = (A == 8'd1);
		  end
	  decrementSetOne: 
		  begin
			out = A - 8'd1;
			flag = A == 8'd2;
		  end
	  adduTwo: out = A + 8'd2;
	  default:;
	endcase
	
  end

endmodule