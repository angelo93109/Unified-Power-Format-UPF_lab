import UPF::*;

module tb(
	output reg cnt_start,
	output reg rst_n
);

reg pwr_switch;
reg iso_control;
reg ret_save, ret_restore;

initial begin
	supply_on("VDD", 1.2);
	// supply_on("VDD_dut",1.2);
	pwr_switch = 1;
	supply_on("VSS", 0.0);
	iso_control = 0;
	cnt_start = 0;
	rst_n = 1; 
	ret_save = 0;
	ret_restore = 0;
	reset_task();
	cnt_start = 1;  
	#60 iso_control = 1; 
	// #5 supply_off("VDD_dut");
	#5 pwr_switch = 0;
	// #30 supply_on("VDD_dut", 1.2);
	#30 pwr_switch = 1;
	reset_task();
	#5 iso_control = 0; 
	#100;
	$finish;
end


initial begin
	#75 ret_save_task;
	#60 ret_restore_task;
end

task reset_task;
	begin
			#10
			rst_n = 0;
			#10
			rst_n = 1; 
	end
endtask

initial begin
	$fsdbDumpfile("power.fsdb"); // Specify the name of the FSDB file
	$fsdbDumpvars(0);     // Dump all variables in the scope of the module 'test'
end 


task ret_save_task;
	begin
		ret_save = 1;
		#10
		ret_save = 0;
	end
endtask

task ret_restore_task;
	begin
		ret_restore = 1;
		#10
		ret_restore = 0;
	end
endtask
endmodule
