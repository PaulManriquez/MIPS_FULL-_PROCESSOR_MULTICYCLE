module Control(
  	input clk,rst,
	input [5:0]  		Opcode,
  	input [5:0]			Function,
  
	output reg 			ALUSrcA,
  	output reg [1:0]	ALUSrcB,
  	output reg [2:0]	ALUControl,	
	output reg [1:0]	PCSrc,
	output reg	 		IRWrite,
	output reg	 		PCWrite,
    output reg 			RegDst,
  	output reg			MemWrite,
  	output reg			MemtoReg,
  	output reg			RegWrite,
  	output reg			Branch
);

  reg [3:0] state;
  reg [3:0] next_state;
  reg [1:0] Ctrl;	//	Control of the ALU
  
  // State verification
  parameter s0_Fetch 			= 4'b0000;
  parameter s1_SDecode 			= 4'b0001;
  parameter s2_MemAdr 			= 4'b0010;
  parameter s3_MemRead 			= 4'b0011;
  parameter s4_MemWriteBack 	= 4'b0100;
  parameter s5_MemWrite			= 4'b0101;
  parameter s6_Execute			= 4'b0110;
  parameter s7_ALUWriteBack 	= 4'b0111;
  parameter s8_Branch			= 4'b1000;
  parameter s9_ADDIExecute		= 4'b1001;
  parameter s10_ADDIWriteBack	= 4'b1010;
  parameter s11_Jump			= 4'b1011;
  
  
  initial
    begin
      state = s0_Fetch;
    end
  
  
  //1. State Reset and Next State
  always @(posedge clk, negedge rst)
  begin
    if(!rst)
		state <= s0_Fetch;
	else
		state <= next_state;
  end
  
  
  //2. Next state process
  always @(state, Opcode)
  begin
	case(state)
          s0_Fetch 			:  next_state = s1_SDecode;
           
          s1_SDecode 		:
            begin
              next_state =	(Opcode == 6'b100011 || Opcode == 6'b101011)	? s2_MemAdr :
              				(Opcode == 6'b000000 ) 	? 	s6_Execute 		:
              				(Opcode == 6'b000100) 	? 	s8_Branch 		:
                            (Opcode == 6'b001000) 	? 	s9_ADDIExecute 	:
                            (Opcode == 6'b000010) 	? 	s11_Jump 		: s0_Fetch;
            end
          s2_MemAdr 		: 
            next_state = (Opcode == 6'b100011) ? s3_MemRead : s5_MemWrite;
          s3_MemRead 		: next_state = s4_MemWriteBack;
          s4_MemWriteBack 	: next_state = s0_Fetch;
          s5_MemWrite		: next_state = s0_Fetch;
          s6_Execute		: next_state = s7_ALUWriteBack;
          s7_ALUWriteBack 	: next_state = s0_Fetch;
          s8_Branch			: next_state = s0_Fetch;
          s9_ADDIExecute	: next_state = s10_ADDIWriteBack;
          s10_ADDIWriteBack	: next_state = s0_Fetch;
          s11_Jump			: next_state = s0_Fetch;
		default: next_state = s0_Fetch;
	endcase 
  end
  
  //3. Output logic process
  always @(state)
  begin
	case(state)
      s0_Fetch 			:  
      	begin
            ALUSrcA 	= 1'b0;
            ALUSrcB 	= 2'b01;
            Ctrl 		= 2'b01;
            PCSrc 		= 2'b00;
            IRWrite 	= 1'b1;
            PCWrite 	= 1'b1;
            RegDst 		= 1'b0;
            MemWrite 	= 1'b0;
            MemtoReg 	= 1'b0;
  			RegWrite 	= 1'b0;
  			Branch 		= 1'b0;
        end
        
      s1_SDecode 		:
        begin
          ALUSrcB 	= 2'b10;
          Ctrl 		= 2'b01;
          IRWrite	= 1'b0;
          PCWrite 	= 1'b0;
        end
      
      s2_MemAdr 		: 
        begin
          ALUSrcA 	= 1'b1;
          ALUSrcB 	= 2'b10;
          Ctrl 		= 2'b01;
        end
      
      s3_MemRead 		: 
      s4_MemWriteBack 	: 
        begin
          RegDst 	= 1'b0;
          MemtoReg 	= 1'b1;
          RegWrite 	= 1'b1;
        end
      
      s5_MemWrite		:
        begin
          MemWrite 	= 1'b1;
        end
      
      s6_Execute		: 
        begin
          ALUSrcA 	= 1'b1;
          ALUSrcB 	= 2'b00;
          Ctrl 		= 2'b00;
        end
      
      s7_ALUWriteBack 	: 
        begin
          RegDst 	= 1'b1;
          MemtoReg 	= 1'b0;
          RegWrite 	= 1'b1;
        end
      
      s8_Branch			:
        begin
          ALUSrcA 	= 1'b1;
          ALUSrcB 	= 2'b00;
          Ctrl  	= 2'b10;
          PCSrc 	= 2'b01;
          Branch 	= 1'b1;
        end
      
      s9_ADDIExecute	: 
        begin
          ALUSrcA 	= 1'b1;
          ALUSrcB 	= 2'b10;
          Ctrl 		= 2'b01;
        end
      
      s10_ADDIWriteBack	: 
        begin
          RegDst 	= 1'b0;
          MemtoReg 	= 1'b0;
          RegWrite 	= 1'b1;
        end
      
      s11_Jump			:
        begin
          PCSrc 	= 2'b10;
          PCWrite 	= 1'b1;
        end
      
	  default: next_state = s0_Fetch;
	endcase
  end
  

  always @(Function,Ctrl)
    if(Ctrl == 2'b00) begin 
      case ({Ctrl,Function}) 
        8'b00100000: ALUControl = 3'b000;    //MIPS OP ADD
        8'b00100010: ALUControl = 3'b001;    //MIPS OP SUB
        8'b00100100: ALUControl = 3'b010;    //MIPS OP AND
        8'b00100101: ALUControl = 3'b011;    //MIPS OP OR
        8'b00101010: ALUControl = 3'b100;    //MIPS OP SLT
      endcase
    end else begin
      case(Ctrl)
          2'b01: ALUControl=3'b000;  //MIPS OP ADD   LW, SW, PC+x, ADDI
          2'b10: ALUControl=3'b001;  //MIPS OP SUB   BEQ, BNE  
      endcase
  end

endmodule