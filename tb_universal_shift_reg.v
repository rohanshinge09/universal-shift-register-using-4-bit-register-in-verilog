`timescale 1ns/1ps

module tb_universal_shift_reg;

reg clk, rst;
reg [1:0] mode;
reg serial_in;
reg [3:0] parallel_in;

wire serial_out;
wire [3:0] q;

universal_shift_reg dut (
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .serial_in(serial_in),
    .parallel_in(parallel_in),
    .serial_out(serial_out),
    .q(q)
);

always #5 clk = ~clk;   

initial 
begin

    clk = 0;
    rst = 1;  
    mode = 2'b00;
    serial_in = 0;
    parallel_in = 4'b0000;

    #10 
    rst = 0;
    #10 
    mode = 2'b11;
        parallel_in = 4'b1011;
    #10 
    mode = 2'b01; serial_in = 1;
    #10 
    mode = 2'b01; serial_in = 0;
    #10 
    mode = 2'b01; serial_in = 1;

    
    #10 
    mode = 2'b10; serial_in = 1;
    #10 
    mode = 2'b10; serial_in = 0;
    #10 
    mode = 2'b00;

    #50 ;
end

endmodule
