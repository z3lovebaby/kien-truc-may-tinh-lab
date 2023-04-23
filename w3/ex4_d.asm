#Laboratory Exercise 4d
.text
	addi $s2,$zero,0 #j
	addi $s1,$zero,19 #i
	addi $t3,$zero,5 #z
	addi $t1,$zero,3 #x
	addi $t2,$zero,6 #y
	addi $t4,$zero,11 #m
	addi $t5,$zero,7 #n
start:
	add $t6,$s1,$s2 # t0 = s1+s2 (i+j)
	add $t7,$t4,$t5 #t6 = t4 + t5 (m+n)
	sub $t0,$t6,$t7 #t0 = i+j - (m+n)
	blez $t0,else # branch to else if i+j<=m+n
	addi $t1,$t1,1 # then part: x=x+1
	addi $t3,$zero,1 # z=1
	j endif # skip “else” part
else: 	addi $t2,$t2,-1 # begin else part: y=y-1
	add $t3,$t3,$t3 # z=2*z
endif: