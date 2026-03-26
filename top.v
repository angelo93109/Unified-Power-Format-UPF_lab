module top;
reg cnt_start, rst_n; 
reg cnt_done;

parameter period = 10; 
bit SystemClock = 0;

tb tb_i (.cnt_start(cnt_start), .rst_n(rst_n));
dut dut_i(.clk(SystemClock), .rst_n(rst_n), .cnt_start(cnt_start), .cnt_done(cnt_done));

always #(period/2) SystemClock = ~SystemClock;

endmodule
