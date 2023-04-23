#Laboratory Exercise 4
.text
start:
	li $s1,0x7fffffff
	li $s2,1
	li $t0,0 #No Overflow is default status
	addu $s3,$s1,$s2 # s3 = s1 + s2
	xor $t1,$s1,$s2 #Test if $s1 and $s2 have the same sign
# same sign -> 0, not ->1
	bltz $t1,EXIT #If not, exit, ??
#same sign -> false -> slt
#not same -> true -> exit
	xor $t2,$s3,$s1 #Test if $s3 and $s1 have the same sign
	bltz $t2,OVERFLOW #If not,overflow
	j EXIT
OVERFLOW:
	li $t0,1 #the result is overflow
EXIT:
