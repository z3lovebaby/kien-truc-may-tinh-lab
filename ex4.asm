.eqv MONITOR_SCREEN 0x10010000
.eqv WHITE 0x00FFFFFF
.eqv GREEN 0x0000FF00
.text
 li $k0, MONITOR_SCREEN
 add $t4,$k0,0
 li $t0,0
 li $t1,0
 li $s1,8
 	
loop1:
	beq $t0,$s1,exit
	addi $t0,$t0,1
	li $t1,0
	j loop2
loop2:
	beq $t1,$s1,loop1
	add $t2,$t1,$t0
	div $t2,$t2,2
	mfhi $t2
	beq $t2,$zero,xanh
 	j trang
 xanh:
 	li $t3, GREEN
 	sw $t3, 0($t4)
 	add $t4,$t4,4
 	addi $t1,$t1,1
 	j loop2
 trang:
 	li $t3, WHITE
 	sw $t3, 0($t4)
 	add $t4,$t4,4
 	addi $t1,$t1,1
 	j loop2
 
 exit:

