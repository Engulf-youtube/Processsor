module registerFile(clock, x_read, y_read, z_write, z_data, RegWrite, x_out, y_out);
  /* 
  	RegisterFile contains 32 32-bit registers capable of 
    holding 32 bit values in each register.
    RegisterFile contains the following : 
    	1. clock.
    	2. x_read : Register 'X' read address.
        3. y_read : Register 'y' read address.
        4. z_write : Any register write address.
        5. z_data : Any Register write data.
        6. x_out : Register 'x' data out bus.
        7. y_out : Register 'y' data out bus.
        8. RegWrite : Reg write or read control signal
  */
  
  input reg RegWrite, clock;
  input reg [4:0] x_read, y_read, z_write;
  input reg [31:0] z_data;
  
  output reg [31:0] x_out, y_out;
  
  // Register File registers declaration
  reg [31:0] reg0; reg [31:0] reg1; reg [31:0] reg2;
  reg [31:0] reg3; reg [31:0] reg4; reg [31:0] reg5;
  reg [31:0] reg6; reg [31:0] reg7; reg [31:0] reg8;
  reg [31:0] reg9;
  
  reg [31:0] reg10; reg [31:0] reg11; reg [31:0] reg12;
  reg [31:0] reg13; reg [31:0] reg14; reg [31:0] reg15;
  reg [31:0] reg16; reg [31:0] reg17; reg [31:0] reg18;
  reg [31:0] reg19;
  
  reg [31:0] reg20; reg [31:0] reg21; reg [31:0] reg22;
  reg [31:0] reg23; reg [31:0] reg24; reg [31:0] reg25;
  reg [31:0] reg26; reg [31:0] reg27; reg [31:0] reg28;
  reg [31:0] reg29;
  
  reg [31:0] reg30; reg [31:0] reg31;
  
  // Writing data onto registers.
  always @ (posedge clock)
  if (RegWrite)
    case (z_write)
      5'd0: reg0 <= z_data;
      5'd1: reg1 <= z_data;
      5'd2: reg2 <= z_data;
      5'd3: reg3 <= z_data;
      5'd4: reg4 <= z_data;
      5'd5: reg5 <= z_data;
      5'd6: reg6 <= z_data;
      5'd7: reg7 <= z_data;
      5'd8: reg8 <= z_data;
      5'd9: reg9 <= z_data;
      
      5'd10: reg10 <= z_data;
      5'd11: reg11 <= z_data;
      5'd12: reg12 <= z_data;
      5'd13: reg13 <= z_data;
      5'd14: reg14 <= z_data;
      5'd15: reg15 <= z_data;
      5'd16: reg16 <= z_data;
      5'd17: reg17 <= z_data;
      5'd18: reg18 <= z_data;
      5'd19: reg19 <= z_data;
      
      5'd20: reg20 <= z_data;
      5'd21: reg21 <= z_data;
      5'd22: reg22 <= z_data;
      5'd23: reg23 <= z_data;
      5'd24: reg24 <= z_data;
      5'd25: reg25 <= z_data;
      5'd26: reg26 <= z_data;
      5'd27: reg27 <= z_data;
      5'd28: reg28 <= z_data;
      5'd29: reg29 <= z_data;
      
      5'd30: reg30 <= z_data;
      5'd31: reg31 <= z_data;
    endcase
  
  
  
  // Register 'x' Read.
  always @ (*)
    case (x_read)
      5'd0: x_out = reg0;
      5'd1: x_out = reg1;
      5'd2: x_out = reg2;
      5'd3: x_out = reg3;
      5'd4: x_out = reg4;
      5'd5: x_out = reg5;
      5'd6: x_out = reg6;
      5'd7: x_out = reg7;
      5'd8: x_out = reg8;
      5'd9: x_out = reg9;
      
      5'd10: x_out = reg10;
      5'd11: x_out = reg11;
      5'd12: x_out = reg12;
      5'd13: x_out = reg13;
      5'd14: x_out = reg14;
      5'd15: x_out = reg15;
      5'd16: x_out = reg16;
      5'd17: x_out = reg17;
      5'd18: x_out = reg18;
      5'd19: x_out = reg19;
      
      5'd20: x_out = reg20;
      5'd21: x_out = reg21;
      5'd22: x_out = reg22;
      5'd23: x_out = reg23;
      5'd24: x_out = reg24;
      5'd25: x_out = reg25;
      5'd26: x_out = reg26;
      5'd27: x_out = reg27;
      5'd28: x_out = reg28;
      5'd29: x_out = reg29;
      
      5'd30: x_out = reg30;
      5'd31: x_out = reg31;
    endcase
  
  // Register 'y' Read.
  always @ (*)
    case (y_read)
      5'd0: y_out = reg0;
      5'd1: y_out = reg1;
      5'd2: y_out = reg2;
      5'd3: y_out = reg3;
      5'd4: y_out = reg4;
      5'd5: y_out = reg5;
      5'd6: y_out = reg6;
      5'd7: y_out = reg7;
      5'd8: y_out = reg8;
      5'd9: y_out = reg9;
      
      5'd10: y_out = reg10;
      5'd11: y_out = reg11;
      5'd12: y_out = reg12;
      5'd13: y_out = reg13;
      5'd14: y_out = reg14;
      5'd15: y_out = reg15;
      5'd16: y_out = reg16;
      5'd17: y_out = reg17;
      5'd18: y_out = reg18;
      5'd19: y_out = reg19;
      
      5'd20: y_out = reg20;
      5'd21: y_out = reg21;
      5'd22: y_out = reg22;
      5'd23: y_out = reg23;
      5'd24: y_out = reg24;
      5'd25: y_out = reg25;
      5'd26: y_out = reg26;
      5'd27: y_out = reg27;
      5'd28: y_out = reg28;
      5'd29: y_out = reg29;
      
      5'd30: y_out = reg30;
      5'd31: y_out = reg31;
    endcase
  
  
endmodule
