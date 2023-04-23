#Laboratory Exercise 4, Home Assignment 1
.text
start:
	li $s1,0xf0000000
	li $s2,-1000
	li $t0,0 #No Overflow is default status
	addu $s3,$s1,$s2 # s3 = s1 + s2
	xor $t1,$s1,$s2 #Test if $s1 and $s2 have the same sign
# same sign -> 0, not ->1
	bltz $t1,EXIT #If not, exit, ??
#same sign -> false -> slt
#not same -> true -> exit
	slt $t2,$s3,$s1 #s3<s1 -> t2 = 1
	bltz $s1,NEGATIVE #Test if $s1 and $s2 is negative?
	beq $t2,$zero,EXIT #s1 and $s2 are positive
 # if $s3 > $s1 --> t2 = 0 then the result is not overflow
	j OVERFLOW
NEGATIVE:
	bne $t2,$zero,EXIT #s1 and $s2 are negative
 # if $s3 < $s1 then the result is not overflow
OVERFLOW:
	li $t0,1 #the result is overflow
EXIT:
