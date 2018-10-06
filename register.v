// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q <= d;
        end
    end

endmodule

/* 
Deliverable 2 : 32-bit register 
Includes 32 bits worth of D flip flops.
*/
module register32 
(
// Flip flops.
output reg [31:0] q,
input [31:0] d,
input wrenable,
input clk
);
    // Should be the same afterwards.
    always @(posedge clk) begin
        if(wrenable) begin
            q <= d;
        end
    end
endmodule

/*
Deliverable 3 : Zero regsiter.
Includes 32 bits, but just ignores inputs.
*/
module register32zero
(
output reg[31:0] q,
input[31:0] d,
input wrenable,
input clk
);
    always @(posedge clk) begin
        q <= 32'd0;
    end
endmodule
