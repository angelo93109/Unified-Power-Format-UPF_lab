all: comp run

clean: 
	rm -rf ucli* simv* csrc diag_dir* mvsim_native_reports* *fsdb *log novas* vc_hdrs.h verdi*
	
comp: 
	vcs top.v tb.v dut.v \
	-sverilog -full64 -debug_acc+all -kdb -upf top.upf -l vcs.log \
	-power=write_mvinfo

run: 
	simv +fsdb+power
	
gui:
	verdi -ssf power.fsdb -sswr signal.rc &
