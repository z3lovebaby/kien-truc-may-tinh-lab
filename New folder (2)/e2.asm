.data
nhaplai: .asciiz "So phan tu phai la so duong\nNhap lai !!!!\n"
.align 2
A: .word #mangsonguyen
.text
	la $s0,A
	add $t0,$zero,$s0
get_num:
	#so luong phan tu
	li $v0, 5
 	syscall
 	blt $v0,0,error_get_num
 	add $s1,$zero,$v0 #s1 = n - so luong phan tu cua mang
 	li $t1,0 #index i =0
get_arr:
	beq $t1,$s1,end_get_arr
	add $t2,$t1,$t1
	add $t2,$t2,$t2
	add $t0,$t0,$t2
	li $v0, 5
 	syscall
 	
 	sw $v0,0($t0)
 	
 	addi $t1,$t1,1
 	j get_arr
 error_get_num:
 	li $v0, 4
 	la $a0, nhaplai
 	syscall
 end_get_arr: