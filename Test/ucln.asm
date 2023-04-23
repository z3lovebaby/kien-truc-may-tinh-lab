.data
mess: .asciiz "UCLN: "
mess1: .asciiz "BCNN: "
Message: .asciiz "Nhap vao so: "
.text


 li $v0, 4
 la $a0, Message
 syscall
 
 li $v0, 5
 syscall
 add $s0,$zero,$v0
 
 li $v0, 4
 la $a0, Message
 syscall
 
 li $v0, 5
 syscall
 add $s1,$zero,$v0

add $t1,$zero,$s0
add $t2,$zero,$s1

loop:
	beq $t1,$t2,endLoop
	blt $t1,$t2,branch
	sub $t1,$t1,$t2
	j loop
	
branch:
	sub $t2,$t2,$t1
	j loop
endLoop:
	add $s2,$zero,$t1
	mul $t3,$s0,$s1
	div $s3,$t3,$s2
