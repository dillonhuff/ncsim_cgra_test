import os

#run_cmd = 'irun -top test -timescale 1ns/100ps -l irun.log -access +rwc -notimingchecks -input cmd.tcl ../../CGRAGenerator/hardware/generator_z/top/genesis_verif/*.v ../../CGRAGenerator/hardware/generator_z/top/genesis_verif/*.sv ./test.v'

#run_cmd = 'irun -top test -timescale 1ns/100ps -l irun.log -access +rwc -notimingchecks -input cmd.tcl ../CGRA_coreir/top.v ./test.v'

run_cmd = 'irun -top test -timescale 1ns/100ps -l irun.log -access +rwc -notimingchecks -input cmd.tcl ../CGRA_partial_eval/ncsim_partial_eval/mul_2_cgra.v ./test.v'

#run_cmd = 'irun -top test -timescale 1ns/100ps -l irun.log -access +rwc -notimingchecks -input cmd.tcl ../../CGRAGenerator/hardware/generator_z/top/genesis_verif/*.v ../../CGRAGenerator/hardware/generator_z/top/genesis_verif/*.sv ./test.v'

res = os.system(run_cmd)

assert(res == 0)
