.data
Message: .asciiz "Nhap vao so: "
Message1: .asciiz "So nguyen to"
Message2: .asciiz "k la So nguyen to"
.text
 li $v0, 4
 la $a0, Message
 syscall
 
 li $v0, 5
 syscall
 add $s0,$zero,$v0
 blt $s0,2,end2
 div $t2,$s0,2
 li $t1,2
 li $t3,0
 
 loop:
 	bgt $t1,$t2,end
 	
 	div $t4,$s0,$t1
 	mul $t4,$t4,$t1
 	beq $t4,$s0,end2
 	addi $t1,$t1,1
 	j loop
 end:
 	li $v0, 4
 	la $a0, Message1
 	syscall
 	j exit
 end2: 
 	li $v0, 4
 	la $a0, Message2
 	syscall
exit:	