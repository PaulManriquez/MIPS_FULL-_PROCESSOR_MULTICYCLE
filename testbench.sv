`timescale 1ns/1ps

module TOP_tb;
 
  reg clk,rts;
  Processor DUT (clk,rts);
  
  initial begin
	clk = 0;
	rts = 1;
	#2
	rts = 0;
	#2
	rts = 1;
    
    $display("INIT PC: %d",DUT.w_PC, 
             "\t Inst: %32b",DUT.w_Instr, 
             );
    #2
    //************************lw**************************
    
    $display("\n\t\t**********\t\tlw $s0,1(0)\t\t***********");
    $display("\t\t**********\t\ts0 <- ram[1+0]\t\t***********");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\tram[1]: %d" 	,DUT.DataMem_1.ram[1] 
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\tram[1]: %d" 	,DUT.DataMem_1.ram[1] 
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\tram[1]: %d" 	,DUT.DataMem_1.ram[1] 
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\tram[1]: %d" 	,DUT.DataMem_1.ram[1] 
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\tram[1]: %d" 	,DUT.DataMem_1.ram[1] 
            );
    #2
    
    //*************************sw*************************
    
    $display("\n\t\t**********\t\tsw $s1,2(0)\t\t***********");
    $display("\t\t**********\t\tram[2+0] <- s1\t\t***********");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\tram[2]: %d" 	,DUT.DataMem_1.ram[2] 
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\tram[2]: %d" 	,DUT.DataMem_1.ram[2] 
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\tram[2]: %d" 	,DUT.DataMem_1.ram[2] 
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\tram[2]: %d" 	,DUT.DataMem_1.ram[2] 
            );
    #2
    
    //***********************ADD***************************
    
    $display("\n\t\t*******\t\tADD $s2,$s0,$s1\t\t**********");
    $display("\t\t*******\t\t$s2 = $s0 + $s1\t\t**********");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\ts2: 	%d" 	,DUT.RegFile_1.reg_File[18]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\ts2: 	%d" 	,DUT.RegFile_1.reg_File[18]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\ts2: 	%d" 	,DUT.RegFile_1.reg_File[18]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\ts2: 	%d" 	,DUT.RegFile_1.reg_File[18]
            );
    #2
    
    //***********************SUB***************************
    
    $display("\n\t\t*******\t\tSUB $s2,$s0,$s1\t\t**********");
    $display("\t\t*******\t\t$s2 = $s0 - $s1\t\t**********");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\ts2: 	%d" 	,DUT.RegFile_1.reg_File[18]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\ts2: 	%d" 	,DUT.RegFile_1.reg_File[18]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\ts2: 	%d" 	,DUT.RegFile_1.reg_File[18]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\ts2: 	%d" 	,DUT.RegFile_1.reg_File[18]
            );
    #2
    
        //***********************AND***************************
    
    $display("\n\t\t*******\t\tAND $s2,$s0,$s1\t\t**********");
    $display("\t\t*******\t\t$s2 = $s0 & $s1\t\t**********");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%4b" 	,DUT.RegFile_1.reg_File[16][3:0],
             "\ts1: 	%4b" 	,DUT.RegFile_1.reg_File[17][3:0],
             "\ts2: 	%4b" 	,DUT.RegFile_1.reg_File[18][3:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%4b" 	,DUT.RegFile_1.reg_File[16][3:0],
             "\ts1: 	%4b" 	,DUT.RegFile_1.reg_File[17][3:0],
             "\ts2: 	%4b" 	,DUT.RegFile_1.reg_File[18][3:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%4b" 	,DUT.RegFile_1.reg_File[16][3:0],
             "\ts1: 	%4b" 	,DUT.RegFile_1.reg_File[17][3:0],
             "\ts2: 	%4b" 	,DUT.RegFile_1.reg_File[18][3:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%4b" 	,DUT.RegFile_1.reg_File[16][3:0],
             "\ts1: 	%4b" 	,DUT.RegFile_1.reg_File[17][3:0],
             "\ts2: 	%4b" 	,DUT.RegFile_1.reg_File[18][3:0]
            );
    #2  
            //***********************OR***************************
    
    $display("\n\t\t*******\t\tOR $s2,$s0,$s1\t\t**********");
    $display("\t\t*******\t\t$s2 = $s0 | $s1\t\t**********");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%4b" 	,DUT.RegFile_1.reg_File[16][3:0],
             "\ts1: 	%4b" 	,DUT.RegFile_1.reg_File[17][3:0],
             "\ts2: 	%4b" 	,DUT.RegFile_1.reg_File[18][3:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%4b" 	,DUT.RegFile_1.reg_File[16][3:0],
             "\ts1: 	%4b" 	,DUT.RegFile_1.reg_File[17][3:0],
             "\ts2: 	%4b" 	,DUT.RegFile_1.reg_File[18][3:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%4b" 	,DUT.RegFile_1.reg_File[16][3:0],
             "\ts1: 	%4b" 	,DUT.RegFile_1.reg_File[17][3:0],
             "\ts2: 	%4b" 	,DUT.RegFile_1.reg_File[18][3:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%4b" 	,DUT.RegFile_1.reg_File[16][3:0],
             "\ts1: 	%4b" 	,DUT.RegFile_1.reg_File[17][3:0],
             "\ts2: 	%4b" 	,DUT.RegFile_1.reg_File[18][3:0]
            );
    #2
    
        //***********************SLT***************************
    
    $display("\n\t\t*****\t\tSLT $s2,$s0,$s1\t\t\t*******");
    $display("\t\t*****\t\t$s2 = ($s0 < $s1) ? 1 : 0\t*******");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\ts2: 	%d" 	,DUT.RegFile_1.reg_File[18]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\ts2: 	%d" 	,DUT.RegFile_1.reg_File[18]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\ts2: 	%d" 	,DUT.RegFile_1.reg_File[18]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\ts2: 	%d" 	,DUT.RegFile_1.reg_File[18]
            );
    #2
    
            //***********************ADDI***************************
    
    $display("\n\t\t*******\t\tADDI $s0,$s1,imm\t*********");
    $display("\t\t*******\t\t$s0 = $s1 + imm\t\t*********");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\timm: 	%d" 	,DUT.w_Instr[15:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\timm: 	%d" 	,DUT.w_Instr[15:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\timm: 	%d" 	,DUT.w_Instr[15:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\timm: 	%d" 	,DUT.w_Instr[15:0]
            );
    #2
    
    //***********************BEQ***************************
    
    $display("\n\t\t*******\t\tBEQ $s0,$s1,offset\t*********");
    $display("\t\t*******\t\t(s0 == s1) ? Branch\t*********");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\toffset: %d" 	,DUT.w_Instr[15:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\toffset: %d" 	,DUT.w_Instr[15:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\toffset: %d" 	,DUT.w_Instr[15:0]
            );
    #2
    
        //***********************BEQ***************************
    
    $display("\n\t\t*******\t\tBEQ $s0,$s0,offset\t*********");
    $display("\t\t*******\t\t(s0 == s0) ? Branch\t*********");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\toffset: %d" 	,DUT.w_Instr[15:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\toffset: %d" 	,DUT.w_Instr[15:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\toffset: %d" 	,DUT.w_Instr[15:0]
            );
    #2
    
    //***********************ADDI***************************
    
    $display("\n\t\t*******\t\tADDI $s0,$s1,imm\t*********");
    $display("\t\t*******\t\t$s0 = $s1 + imm\t\t*********");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\timm: 	%d" 	,DUT.w_Instr[15:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\timm: 	%d" 	,DUT.w_Instr[15:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\timm: 	%d" 	,DUT.w_Instr[15:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\timm: 	%d" 	,DUT.w_Instr[15:0]
            );
    #2
    
        //***********************Jump***************************
    
    $display("\n\t\t*******\t\tJump Target\t\t*********");
    $display("\t\t*******\t\tJump to inst Target\t\t*********");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\tTarget: 	%d" 	,DUT.w_Instr[26:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\tTarget: 	%d" 	,DUT.w_Instr[26:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\tTarget: 	%d" 	,DUT.w_Instr[26:0]
            );
    #2

    //***********************ADDI***************************
    
    $display("\n\t\t*******\t\tADDI $s0,$s1,imm\t*********");
    $display("\t\t*******\t\t$s0 = $s1 + imm\t\t*********");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\timm: 	%d" 	,DUT.w_Instr[15:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\timm: 	%d" 	,DUT.w_Instr[15:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\timm: 	%d" 	,DUT.w_Instr[15:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\ts0: 	%d" 	,DUT.RegFile_1.reg_File[16],
             "\ts1: 	%d" 	,DUT.RegFile_1.reg_File[17],
             "\timm: 	%d" 	,DUT.w_Instr[15:0]
            );
    #2
            				//***********************Jump***************************
    
    $display("\n\t\t*******\t\tJump Target\t\t*********");
    $display("\t\t*******\t\tJump to inst Target\t\t*********");
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\tTarget: 	%d" 	,DUT.w_Instr[26:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\tTarget: 	%d" 	,DUT.w_Instr[26:0]
            );
    #2
    $display("PC: 		%d"		,DUT.w_PC, 
             "\t State: %d"		,DUT.Control_1.state,
             "\tTarget: 	%d" 	,DUT.w_Instr[26:0]
            );
    #2
    $finish;
  end
  
  always #1 clk = ~clk;
  
endmodule