GHDL_FLAGS := --std=08

run_part1_tb: part1_tb
	ghdl -r $(GHDL_FLAGS) part1_tb --wave=part1.ghw --stop-time=15us

run_mult10_tb: mult10_tb
	ghdl -r $(GHDL_FLAGS) mult10_tb --wave=mult10.ghw --stop-time=15ns

run_datapath_tb: datapath_tb
	ghdl -r $(GHDL_FLAGS) datapath_tb --wave=datapath.ghw --stop-time=100ns

run_comparator_tb: comparator_tb
	ghdl -r $(GHDL_FLAGS) comparator_tb --wave=comparator.ghw --stop-time=15ns
	
run_reg32_tb: reg32_tb
	ghdl -r $(GHDL_FLAGS) reg32_tb --wave=reg32.ghw --stop-time=100ns

run_adder32_tb: adder32_tb
	ghdl -r $(GHDL_FLAGS) adder32_tb --wave=adder32.ghw --stop-time=15ns

mult10_tb: import_vhdl
	ghdl -m $(GHDL_FLAGS) mult10_tb

part1_tb: import_vhdl
	ghdl -m $(GHDL_FLAGS) part1_tb

datapath_tb: import_vhdl
	ghdl -m $(GHDL_FLAGS) datapath_tb

comparator_tb: import_vhdl
	ghdl -m $(GHDL_FLAGS) comparator_tb

reg32_tb: import_vhdl
	ghdl -m $(GHDL_FLAGS) reg32_tb

adder32_tb: import_vhdl
	ghdl -m $(GHDL_FLAGS) adder32_tb

import_vhdl:
	ghdl -i $(GHDL_FLAGS) ../src/vhdl/*.vhd
	ghdl -i $(GHDL_FLAGS) *.vhd
