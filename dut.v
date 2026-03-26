module dut(
	input clk,
	input rst_n,
	input cnt_start,  
	output reg cnt_done
);

reg [2:0] cnt_reg;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		cnt_reg <= 5'b0; 
	else if(cnt_start)
		cnt_reg <= cnt_reg + 1'b1; 
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		cnt_done <= 1'b0; 
	else if(cnt_reg == 3'b111)
		cnt_done <= 1'b1; 
end

endmodule

