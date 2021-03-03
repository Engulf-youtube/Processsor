module InsTest;
  
  wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;
  
  reg [31:0] IR;
  
  instruction_decode ins_dec(.IR(IR), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), .ALUOp1(ALUOp1), .ALUOp0(ALUOp0));
  
  initial
    begin
      //$dumpfile("alu.vcd"); $dumpvars(0,aluTest);
      $monitor($time, " IR = %d RegDst = %b ALUSrc = %b MemtoReg = %b RegWrite = %b MemRead = %b MemWrite = %b Branch = %b ALUOp1 = %b ALUOp0 = %b",IR, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0);
      
      #5 IR = 32'b00000010000100001000010000100000; // Reg type instruction. 000000 (opcode) 10000(rs) 10000(rt) 10000(rd) 10000(shamt) 100000(func)
      #5 $finish;
    end
endmodule






// module controlTest;
  
//   wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;
  
//   reg [5:0] opcode;
  
//   control control_unit(.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), .ALUOp1(ALUOp1), .ALUOp0(ALUOp0));
  
//   initial
//     begin
//       //$dumpfile("alu.vcd"); $dumpvars(0,aluTest);
//       $monitor($time, " opcode = %d RegDst = %b ALUSrc = %b MemtoReg = %b RegWrite = %b MemRead = %b MemWrite = %b Branch = %b ALUOp1 = %b ALUOp0 = %b",opcode, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0);
      
//       #5 opcode = 6'b000000; // Reg type opcode
//       #5 opcode = 6'b100011; // load word opcode
//       #5 opcode = 6'b101011; // store word opcode
//       #5 opcode = 6'b000100; // branch opcode
//       #5 $finish;
//     end
// endmodule