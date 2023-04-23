#Laboratory Exercise 1
.text
	addi $s2,$zero,2 #j
	addi $s1,$zero,3 #i
	addi $t3,$zero,5 #z
	addi $t1,$zero,3 #x
	addi $t2,$zero,6 #y
start:
	slt $t0,$s2,$s1 # j<i
	bne $t0,$zero,else # branch to else if j<i slt t0 t1 t2 0->t1>t2
	addi $t1,$t1,1 # then part: x=x+1
	addi $t3,$zero,1 # z=1
	j endif # skip “else” part
else: 	addi $t2,$t2,-1 # begin else part: y=y-1
	add $t3,$t3,$t3 # z=2*z
endif:
