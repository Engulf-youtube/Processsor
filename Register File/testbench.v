module registerFile_Test;
  // Inputs
  reg clock;
  reg [4:0] x_read, y_read, z_write;
  reg RegWrite;
  reg [31:0] z_data;
  
  // Outputs
  wire [31:0] x_out, y_out;
  
   initial begin 
     clock = 0;
     forever begin
     	#10 clock = ~clock;
 	 end
   end
  
  registerFile RegFile(.clock(clock), .x_read(x_read), .y_read(y_read), .z_write(z_write), .z_data(z_data), .RegWrite(RegWrite), .x_out(x_out), .y_out(y_out));
  
  initial
    begin
    //$dumpfile("regFile.vcd"); $dumpvars(0,registerFile_Test);
    $monitor($time, " clock = %d x_read = %d y_read = %d z_write = %d z_data = %d RegWrite = %d x_out = %d y_out = %d", clock, x_read, y_read, z_write, z_data, RegWrite, x_out, y_out);
     
      #10 RegWrite = 1; z_write = 5'd4; z_data = 32'd32; 
  	  #10 RegWrite = 1; z_write = 5'd16; z_data = 32'd24; 
  
  	  #10 RegWrite = 0; x_read = 5'd4; 
  	  #10 RegWrite = 0; x_read = 5'd16; 
  
      #10 RegWrite = 0; x_read = 5'd20;
      #10 $finish;
    end
endmodule