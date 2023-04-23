#Laboratory Exercise 4b
.text
	addi $s2,$zero,2 #j
	addi $s1,$zero,1 #i
	addi $t3,$zero,5 #z
	addi $t1,$zero,3 #x
	addi $t2,$zero,6 #y
start:
	sub $t0,$s1,$s2 # t0 = s1 - s2
	bltz $t0,else # branch to else if i<j
	addi $t1,$t1,1 # then part: x=x+1
	addi $t3,$zero,1 # z=1
	j endif # skip “else” part
else: 	addi $t2,$t2,-1 # begin else part: y=y-1
	add $t3,$t3,$t3 # z=2*z
endif: