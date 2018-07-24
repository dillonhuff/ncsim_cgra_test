import os

#run_cmd = 'irun -status -top test -timescale 1ns/1ns -l irun.log -access -rwc -notimingchecks -input cmd.tcl ./cgra_dev_no_mdll_05_15_2018/*.v ./cgra_dev_no_mdll_05_15_2018/*.sv ./test.v'
#run_cmd = 'irun -status -top test -timescale 1ns/1ns -l irun.log -access -rwc -notimingchecks -input cmd.tcl ./top_no_op.v ./test.v'

#run_cmd = 'irun -top test -timescale 1ns/1ns -l irun.log -access -rwc -notimingchecks -input cmd.tcl ../CGRA_coreir/cgra_with_config_ports/*.v ../CGRA_coreir/cgra_with_config_ports/*.sv ./test.v'

#run_cmd = 'irun -status -top test -timescale 1ns/100ps -l irun.log -access +rwc -notimingchecks -input cmd.tcl ../CGRA_coreir/top.v ./test.v'

#run_cmd = 'irun -status -top test -timescale 1ns/1ns -l irun.log -access -rwc -notimingchecks -input cmd.tcl ../FlatCircuit/test/top.v ./test.v'

#run_cmd = 'irun -status -top test -timescale 1ns/100ps -l irun.log -access +rwc -notimingchecks -input cmd.tcl ../CGRA_partial_eval/ncsim_partial_eval/mul_2_cgra.v ./test.v'

run_cmd = 'irun -status -top test -timescale 1ns/1ns -l irun.log -access -rwc -notimingchecks -input cmd.tcl ../../CGRAGenerator/hardware/generator_z/top/genesis_verif/*.v ../../CGRAGenerator/hardware/generator_z/top/genesis_verif/*.sv ./test.v'

res = os.system(run_cmd)

assert(res == 0)
