.text
	addi $t1,$zero,2
	addi $t2,$zero,3
	add $t0,$t1,$t2
loop:	
	addi $t3,$zero,4
	add $t0,$t0,$t3
	j loop