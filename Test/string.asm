.data
string: .asciiz "abcdrhdcba"
.text

init:
	la $a3,string
	li $t0,0
get_length:
	add $t1,$t0,$a3
	lb $t2,0($t1)
	beq $t2, $zero, end_of_str # is null char? 
 	addi $t0, $t0, 1 # $t0 = $t0 + 1 -> i = i + 1
 	j get_length
end_of_str:
	div $s0,$t0,2  #s0 = length /2
	add $s1,$t0,-1 #s1 = length -1
	li $t0,0
loop:
	bgt $t0,$s0,end_loop
	add $t1,$t0,$a3
	sub $t3,$s1,$t0
	add $t2,$t3,$a3
	lb $t4,0($t1)
	lb $t5,0($t2)
	bne $t4,$t5, end2
	addi $t0,$t0,1
	j loop
end_loop:
	li $s5,1
	j exit
end2:
	li $s5,0
exit: