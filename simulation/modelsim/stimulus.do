force -freeze /inclk0 0 0, 1 {10 ns} -r 20 ns
add wave inclk0
add wave  DAB_CLK_P
#add wave -radix unsigned MM 
#add wave -radix unsigned cnt
#add wave -radix unsigned cntTrunc
#add wave -radix decimal sine
add wave -radix unsigned DAB 
run 10 ms