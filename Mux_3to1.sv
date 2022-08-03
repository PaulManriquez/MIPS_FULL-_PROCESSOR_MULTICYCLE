module Mux_3to1 
#(
	parameter WIDTH = 32
)
( 
  input 	[WIDTH-1:0] X, Y, Z,
  input 	[1:0]Sel,
  output	[WIDTH-1:0] O
);

  assign O = (Sel == 2'b00 ) ? X :
    (Sel == 2'b01 ) ? Y :
    (Sel == 2'b10 ) ? Z :
           2'bxx;

endmodule
