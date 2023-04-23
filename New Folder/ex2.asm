#Laboratory Exercise 2
.text
li $s0, 0x12345678 #load test value for these function
andi $t0, $s0, 0xff000000 
srl  $t1,$t0,24 #Extract the MSB of $s0 
andi,$t2,$s0,0xffffff00 #clear lsb of s0
ori, $t2,$s0,0x000000ff #Set 1 for LSB of $s0
andi $s0, $s0, 0 #clear $s0

