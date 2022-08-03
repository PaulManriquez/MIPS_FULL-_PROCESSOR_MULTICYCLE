module Or_Gate
#(
	parameter N_BITS = 8
)
(
	// Input Ports 
	input [N_BITS-1 : 0] A,
	input [N_BITS-1 : 0] B,
	
	// Output Ports
	output [N_BITS-1 : 0] C

);

assign C = A | B;


endmodule