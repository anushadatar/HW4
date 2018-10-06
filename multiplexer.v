/* Deliverable 4 : 32 : 1 Multiplexer
Uses behavioral verilog to multiplex.*/
module mux32to1by1
(
output out,
input[4:0] address,
input[31:0] inputs
);
// Because the wires have already been assigned, we literally
// only need one line from the sample code.
    assign out=inputs[address];
endmodule

module mux32to1by32
(
output[31:0] out,
input[4:0] address,
input[31:0] in
);
    // Create 2D Array of wires.
    wire[31:0] mux[31:0];
    // There is no chance I am typing that many lines.
    genvar muxindex;
    generate
        for (muxindex=0; muxindex<32; muxindex=muxindex+1) begin: value
            assign mux[muxindex] = in[muxindex];
        end
    endgenerate

    assign out = mux[address];
endmodule
