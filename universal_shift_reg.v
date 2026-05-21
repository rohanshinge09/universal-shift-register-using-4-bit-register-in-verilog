module universal_shift_reg(
    input clk,
    input rst,
    input [1:0] mode,       
    input serial_in,         
    input [3:0] parallel_in, 
    output reg serial_out,   
    output reg [3:0] q       
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 4'b0000;
        serial_out <= 1'b0;
    end
    else begin
        case(mode)

            2'b00: begin
                
                q <= q;
            end

            2'b01: begin
                
                serial_out <= q[0];        
                q <= {serial_in, q[3:1]};
            end

            2'b10: begin
                
                serial_out <= q[3];        
                q <= {q[2:0], serial_in};
            end

            2'b11: begin
                
                q <= parallel_in;
            end

        endcase
    end
end

endmodule
