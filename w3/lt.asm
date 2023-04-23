beq, bne

bltz, blez, bgtz, bgez #1
$s1 $s2
<,<=,>,>=
Cach 1: Sub -> #1
Cach 2: slt $t0,$t1,$t2


#khai bao mang:
.data
 A: .word 1,2,3,4,5,6
 .text
 la $s2, A