`include "Control.sv"
`include "PC.sv"
`include "InstMem.sv"
`include "DataMem.sv"
`include "Register_With_Enable.sv"
`include "Register.sv"
`include "Mux_2to1.sv"
`include "RegFile.sv"
`include "SignExt.sv"
`include "Mux_3to1.sv"
`include "ALU.sv"
`include "AND_gate.sv"
`include "Or_Gate.sv"

module Processor(  
      input clk,                    
      input rst                        
 );
  
parameter WIDTH = 32;
  
  wire [31:0] w_rd1;
  wire [31:0] w_rd2;
  wire [31:0] w_A;
  wire [31:0] w_B;
  wire [31:0] w_SignImm;
  wire [31:0] w_SrcA;
  wire [31:0] w_SrcB;
  wire [31:0] w_ALUResult;
  wire [31:0] w_RD_Instr;
  wire [31:0] w_PCP;
  wire [31:0] w_PC;
  wire [31:0] w_ALUOut;
  wire [31:0] w_Data;
  wire [31:0] w_Instr;
  wire [31:0] w_data_mux;
  wire [31:0] w_WD;
  wire [31:0] w_RD_Data;
  
  wire [4:0] w_wreg;
  wire [2:0] w_alu_ctrl;
  wire [1:0] w_PCSrc; 
  
  wire w_Zero;
  wire w_Branch; 
  wire w_PCWrite;
  wire w_PCEn;
  wire w_Out_And;
  
  wire w_MemWrite;
  wire w_IRWrite; 
  wire w_RegDst;
  wire w_MemtoReg;
  wire w_RegWrite;
  wire w_ALUSrcA;
  wire[1:0] w_ALUSrcB;
  wire[2:0] w_ALUControl;

Control
Control_1
(
  .clk(clk),
  .rst(rst),
  .Opcode		(w_Instr[31:26]),
  .Function		(w_Instr[5:0]),
  
  .ALUSrcA		(w_ALUSrcA),
  .ALUSrcB		(w_ALUSrcB),
  .ALUControl	(w_ALUControl),
  .PCSrc		(w_PCSrc),
  .IRWrite		(w_IRWrite),
  .PCWrite		(w_PCWrite),
  .RegDst		(w_RegDst),
  .MemWrite		(w_MemWrite),
  .MemtoReg		(w_MemtoReg),
  .RegWrite		(w_RegWrite),
  .Branch		(w_Branch)
);

PC #(
	.WIDTH(WIDTH)
) 
PC_1
(
	.clk(clk),
	.rst(rst),
	.DataIn(w_PCP),
    .enable(w_PCEn),
	.DataOut(w_PC) 
);
  
InstMem 
InstMem_1
(
	.addr(w_PC),
  	.q(w_RD_Instr) 
);
 
DataMem 
DataMem_1
(
	.clk(clk),
	.rst(rst),
	.WD(w_B),
	.A(w_ALUOut),
	.we(w_MemWrite),
  	.RD(w_RD_Data)
);

Register_With_Enable
#(
	.WORD_LENGTH(WIDTH)
)
Register_With_Enable_Instr
(
	.clk(clk),
	.reset(rst),
	.enable(w_IRWrite),
	.Data_Input(w_RD_Instr),
	.Data_Output(w_Instr)
);
  
Register
#(
	.WORD_LENGTH(WIDTH)
)
Resiter_Data
(
	.clk(clk),
	.reset(rst),
	.Data_Input(w_RD_Data),
	.Data_Output(w_Data)
);

Mux_2to1 
#(
  .WIDTH(5)
)
Mux_2to1_RegDst
( 
	.X(w_Instr[20:16]), 
	.Y(w_Instr[15:11]),
	.Sel(w_RegDst),
	.Z(w_wreg)
);

Mux_2to1 
#(
  .WIDTH(WIDTH)
)
Mux_2to1_MemtoReg
( 
	.X(w_ALUOut), 
	.Y(w_Data),
  	.Sel(w_MemtoReg),
	.Z(w_data_mux)
);

RegFile 
RegFile_1
(
	.clk(clk), 
	.reset(rst), 
	.Read_Register_1(w_Instr[25:21]),
	.Read_Register_2(w_Instr[20:16]),
	.Write_Register(w_wreg), 
	.Write_Data(w_data_mux),   
  	.reg_Write(w_RegWrite),  
	
	.Read_Data_1(w_rd1),
	.Read_Data_2(w_rd2)
);
  
SignExt 
SignExt_1
(
	.DataIn(w_Instr[15:0]), 
	.DataOut(w_SignImm)
);
  
Register
#(
	.WORD_LENGTH(WIDTH)
)
Register_A
(
	.clk(clk),
	.reset(rst),
	.Data_Input(w_rd1),
	.Data_Output(w_A)
);
  
Register
#(
	.WORD_LENGTH(WIDTH)
)
Register_B
(
	.clk(clk),
	.reset(rst),
	.Data_Input(w_rd2),
	.Data_Output(w_B)
);
  
Mux_2to1 
#(
  .WIDTH(WIDTH)
)
Mux_2to1_SrcA
( 
	.X(w_PC), 
	.Y(w_A),
	.Sel(w_ALUSrcA),
	.Z(w_SrcA)
);

Mux_3to1 
#(
  .WIDTH(WIDTH)
)
Mux_3to1_SrcB
( 
  .X(w_B), 
  .Y(1), 
  .Z(w_SignImm),
  .Sel(w_ALUSrcB),
  .O(w_SrcB)
);

ALU
ALU_1
(
      .ALUCtl(w_ALUControl),
	.SrcA(w_SrcA),
	.SrcB(w_SrcB),
	.Result(w_ALUResult),
	.Zero(w_Zero)
);

AND_gate 
AND_gate_1
(
	.A(w_Branch), 
	.B(w_Zero),
	.Y(w_Out_And) 
);

  
Or_Gate
#(
  .N_BITS(1)
)
Or_Gate_1
(
  .A(w_PCWrite),
  .B(w_Out_And),
  .C(w_PCEn)
);
  
  
Register
#(
	.WORD_LENGTH(WIDTH)
)
Register_alu
(
	.clk(clk),
	.reset(rst),
	.Data_Input(w_ALUResult),
	.Data_Output(w_ALUOut)
);


Mux_3to1 
#(
  .WIDTH(WIDTH)
)
Mux_3to1_final
( 
  .X(w_ALUResult), 
  .Y(w_ALUOut), 
  .Z({w_PC[31:26],w_Instr[25:0]}),
  .Sel(w_PCSrc),
  .O(w_PCP)
);

endmodule 










