#Laboratory Exercise 4, Home Assignment 2
.text
li $s0, 0x0563 #load test value for these function
andi $t0, $s0, 0xff #Extract the LSB of $s0
andi $t1, $s0, 0x0400 #Extract bit 10 of $s0
#1379: 0101 0110 0011
 #     0000 1111 1111
  #  ->0000 0110 0011 muon ktra bit nao cho and vs 1 o bit do