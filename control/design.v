module instruction_decode(IR, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0);
  /*
  	Decodes Instruction to multiple parts like opcode, registers, etc
    Args:
    	IR: (reg type): Contains 32-bit instruction
  */
  
  // Declaration
  
  input [31:0] IR; 
  reg [5:0] opcode;
  
  output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;
  
  // Declaration of control signals
  reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;

  parameter load_type_ins = 6'd35, store_type_ins = 6'd43, branch_type_ins = 6'd1, reg_type_ins = 6'd0;
  
  reg [4:0] arithmetic_rs;
  reg [4:0] arithmetic_rt;
  reg [4:0] arithmetic_rd;
  reg [4:0] arithmetic_shamt;
  reg [5:0] arithmetic_funct;
  reg [4:0] ls_rs;
  reg [4:0] ls_rt;
  reg [15:0] ls_address;
  reg [4:0] bi_rs;
  reg [4:0] bi_rt;
  reg [15:0] bi_address;
  
  always @(IR)
    begin
    case(opcode)
      
      reg_type_ins:
        begin
          // R-type instruction  Arithmetic instruction format          
          arithmetic_rs = IR[25:21];
          arithmetic_rt = IR[20:16];
          arithmetic_rd = IR[15:11];
          arithmetic_shamt = IR[10:6];
          arithmetic_funct = IR[5:0];
        end
  	
      load_type_ins:
        begin
          // Load instruction
          ls_rs = IR[25:21];
          ls_rt = IR[20:16];
          ls_address = IR[15:0];
        end
  
      store_type_ins:
        begin
          // Store instruction
          ls_rs = IR[25:21];
          ls_rt = IR[20:16];
          ls_address = IR[15:0];
        end
      
      branch_type_ins:
        begin
          // Branch instruction
          bi_rs = IR[25:21];
          bi_rt = IR[20:16];
          bi_address = IR[15:0];
        end

	endcase

    opcode = IR[31:26];   
      
    control control_unit(.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), .ALUOp1(ALUOp1), .ALUOp0(ALUOp0));
   
    end
endmodule
      



      
module control(opcode,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0);
  /*
  	Generates the following control signals based on the opcode
      1. RegDst
      2. ALUSrc
      3. MemtoReg
      4. RegWrite
      5. MemRead
      6. MemWrite
      7. Branch
      8. ALUOp1
      9. ALUO
   */
  
  input [5:0] opcode;
  
  output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;
  
  // Declaration of control signals
  reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;
  
  // Defining instruction types obtained from opcode
  parameter r_type = 6'b000000, lw = 6'b100011, sw = 6'b101011 , beq = 6'b000100;
  
  always @(opcode)
    begin
      
    case(opcode)
  	 
      // Defining Behaviour if opcode is register type
      r_type : 
        begin
          RegDst = 1;
          ALUSrc = 0;    
          MemtoReg = 0;
          RegWrite = 1;
          MemRead = 0;
          MemWrite = 0;
          Branch = 0;
          ALUOp1 = 1;
          ALUOp0 = 0;
        end
      
      // Defining Behaviour if opcode is load word
      lw : 
        begin
          RegDst = 0;
          ALUSrc = 1;
          MemtoReg = 1;
          RegWrite = 1;
          MemRead = 1;
          MemWrite = 0;
          Branch = 0;
          ALUOp1 = 0;
          ALUOp0 = 0;
        end
      
      // Defining Behaviour if opcode is store word
      sw :
        begin
          RegDst = 1'bx; 
          ALUSrc = 1;
          MemtoReg = 1'bx;
          RegWrite = 0;
          MemRead = 0;
          MemWrite = 1;
          Branch = 0;
          ALUOp1 = 0;
          ALUOp0 = 0;
        end
      
      // Defining Behaviour if opcode is branch equal ( beq )
      beq : 
        begin
          RegDst = 1'bx;
          ALUSrc = 0;
          MemtoReg = 1'bx;
          RegWrite = 0;
          MemRead = 0;
          MemWrite = 0;
          Branch = 1;
          ALUOp1 = 0;
          ALUOp0 = 1;
        end
      
    endcase
    end
endmodule