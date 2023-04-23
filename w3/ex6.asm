
#Laboratory 6
.data
	A: .word 1,2,-9,10,5,6
.text
	la $s2,A 
	addi $s5, $zero, 0 # maxabs = 0
	addi $s1, $zero, 0 # i = 0
	addi $s3,$zero,6 #n
	addi $s4,$zero,1 #step
	addi $s6,$zero,2 # chia s6, chia 2
loop: 	slt $t2, $s1, $s3 # $t2 = i < n ? 1 : 0
	beq $t2, $zero, endloop
	add $t1, $s1, $s1 # $t1 = 2 * $s1
	add $t1, $t1, $t1 # $t1 = 4 * $s1
	add $t1, $t1, $s2 # $t1 store the address of A[i]
	lw $t0, 0($t1) # load value of A[i] in $t0
	abs $t3,$t0
	
	sub $t4,$t3,$s5
	abs $t4,$t4
	add $t5,$t3,$s5
	add $s5,$t4,$t5
	div $s5,$s6
	mflo $s5
#tinh max bang (sum+sub)/2
	add $s1, $s1, $s4 # i = i + step
	j loop # goto loop
endloop: