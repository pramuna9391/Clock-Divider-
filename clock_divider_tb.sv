module clock_divider_tb;
    logic clk;
    logic reset;
    logic clk_out;

    // Instantiate the design under test (DUT)
    clock_divider dut (
        .clk(clk),
        .reset(reset),
        .clk_out(clk_out)
    );

    // Generate 100MHz clock => 10ns period (toggle every 5ns)
    always #5 clk = ~clk;

    initial begin
        $display("Time\tclk\treset\tclk_out");
        $monitor("%0t\t%b\t%b\t%b", $time, clk, reset, clk_out);

        // Initialization
        clk = 0;
        reset = 1;
        #15;
        reset = 0;

        // Run simulation for 100ns
        #100;
        $finish;
    end
endmodule
