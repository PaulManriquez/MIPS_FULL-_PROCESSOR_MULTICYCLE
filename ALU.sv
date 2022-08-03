// Code your design here
module ALU (
  input [2:0] ALUCtl,
  input [31:0] SrcA,SrcB,
  output reg [31:0] Result,
  output Zero
);
  
  reg reg_zero;
  always @(SrcA, SrcB, ALUCtl)
  begin
   case(ALUCtl)
     3'b000 : Result <= SrcA + SrcB;
     3'b001 : Result <= SrcA - SrcB;
     3'b010 : Result <= SrcA & SrcB;
     3'b011 : Result <= SrcA | SrcB;
     3'b100 : Result <= SrcA < SrcB ? 1:0; //SLT
     default: Result <= 0;
   endcase
  end
  
  always @(Result)
  begin
    reg_zero = (Result == 0) ? 1'b1 : 1'b0;
  end
  
  
 assign Zero = reg_zero;
endmodule