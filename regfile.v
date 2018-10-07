`include "register.v"
`include "multiplexer.v"
`include "decoders.v"


//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

module regfile
(
output[31:0] ReadData1,	// Contents of first register read
output[31:0] ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);
    
    // Setup.
    wire[31:0] RegisterFile[31:0];
    wire[31:0] Decoder;

    // Read.
    assign ReadData1 = RegisterFile[ReadRegister1];
    assign ReadData2 = RegisterFile[ReadRegister2];

    // Write.
    
    // I am surprised this syntax works, but I won't fight it.
    decoder1to32 decoder(.out(Decoder), .enable(RegWrite), .address(WriteRegister));
    register32zero register(.q(RegisterFile[0]), .d(WriteData), .wrenable(Decoder[0]), .clk(Clk));

    genvar RegisterValue;
    generate
        for (RegisterValue=1; RegisterValue<32; RegisterValue=RegisterValue+1)begin: RegisterLoop
            register32 register(.q(RegisterFile[RegisterValue]), .d(WriteData), .wrenable(Decoder[RegisterValue]), .clk(Clk));
        end
    endgenerate
endmodule
