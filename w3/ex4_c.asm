#Laboratory Exercise 4c
.text
	addi $s2,$zero,0 #j
	addi $s1,$zero,-1 #i
	addi $t3,$zero,5 #z
	addi $t1,$zero,3 #x
	addi $t2,$zero,6 #y
start:
	add $t0,$s1,$s2 # t0 = s1+s2 (i+j)
	bgtz $t0,else # branch to else if i+j>0
	addi $t1,$t1,1 # then part: x=x+1
	addi $t3,$zero,1 # z=1
	j endif # skip “else” part
else: 	addi $t2,$t2,-1 # begin else part: y=y-1
	add $t3,$t3,$t3 # z=2*z
endif: