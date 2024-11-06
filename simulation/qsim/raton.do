onerror {quit -f}
vlib work
vlog -work work raton.vo
vlog -work work raton.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.contador_n_bits_vlg_vec_tst
vcd file -direction raton.msim.vcd
vcd add -internal contador_n_bits_vlg_vec_tst/*
vcd add -internal contador_n_bits_vlg_vec_tst/i1/*
add wave /*
run -all
