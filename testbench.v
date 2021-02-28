module aluTest;
  reg [3:0] ALUctl; wire [31:0] ALUOut; reg [31:0] A,B; 
  wire Zero;
  
  MIPSALU ALU(.ALUctl(ALUctl), .A(A), .B(B), .ALUOut(ALUOut), .Zero(Zero));
  
  initial
    begin
      //$dumpfile("alu.vcd"); $dumpvars(0,aluTest);
      $monitor($time, " ALUOUT = %d ZERO = %d Aluctl = %d",ALUOut, Zero, ALUctl);
      
      #5 A = 32'd12; B =32'd10; ALUctl = 4'b0000;
      #5  ALUctl = 4'b0001;
      #5  ALUctl = 4'b0010;
      #5  ALUctl = 4'b0110;
      #5  ALUctl = 4'b0111;
      #5  ALUctl = 4'b1100;
      #5 $finish;
    end
endmodule