.data
Message: .asciiz "Nhap vao so N duong: "
nhaplai: .asciiz "Nhap lai so duong !!!!\n"
xuongdong: .asciiz "\n"
kq: .asciiz "Ket qua:\n"
.text
#####################

# $s0: so luong phan tu N
# $t0: index

######################
#nhap vao so N, luu vao $s0
get_num:
 	li $v0, 51
 	la $a0, Message
 	syscall
 	
 	bne $a1,0,nhap_lai #status #0 -> nhap lai
check:
#kiem tra dieu kien dau vao
	bgt $a0,0,continue #N > 0 tiep tuc ctrinh
	#N<0 thong bao, va yeu caau nhap lai
	nhap_lai:
	li $v0, 4
 	la $a0, nhaplai
 	syscall
 	
	j get_num
#khoi tao cac gtri ban dau, loop 1->N de ktra tinh chia het cho 3,5
continue:
	add $s0,$zero,$a0
	li $t0,1 #index i = 1
	
	#in ra string "Ket qua: " RUN I/O
	li $v0, 4
 	la $a0, kq
 	syscall
 	#loop 1->N
	for:
		bgt $t0,$s0,exit #i>N exit
		j chia3 #check i chia het cho 3 ko
		j chia5 #check i chia het cho 5 ko
	dk_for: #i = i+1, tiep tuc for
		addi $t0,$t0,1
		j for

chia3:
	div $t1,$t0,3 #t1 = t0/3 chia nguyen
	mul $t1,$t1,3 #t1 = t1*3
	bne $t1,$t0,chia5 #t1 # t0 ->ko chia het 3, kieam tra chia 5 ko
	j print # chia het cho 3, print: in kq
chia5:
	#tuong tu chia3, neu ko chia het 5 thi tiep tuc loop
	div $t1,$t0,5
	mul $t1,$t1,5
	bne $t1,$t0,dk_for
	j print
print:
	li $v0, 1 # service 1 is print integer
 	la $a0, 0($t0) # the interger to be printed is t0
 	syscall
 	#xuong dong cac phan tu
 	li $v0, 4
 	la $a0,xuongdong
 	syscall
 	j dk_for
 exit:
 #ket thuc chuong trinh
	
