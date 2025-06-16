module clock_divider (
    input  logic clk,      // Input clock
    input  logic reset,    // Synchronous reset
    output logic clk_out   // Output divided clock
);
    logic [1:0] count;     // 2-bit counter (for divide by 4)

    always_ff @(posedge clk) begin
        if (reset)
            count <= 2'd0;
        else
            count <= count + 1;
    end

    assign clk_out = count[1]; // Output toggles every 2 clock cycles
endmodule
