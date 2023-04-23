#Laboratory Exercise 5
.data
n: .word 3
.text
la $t0,n
lw $s3,0($t0)
li $s0,1 #s0=1
sllv $s1,$s0,$s3 #s1=s0*2^s3