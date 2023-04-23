.data
A: .word #mangsonguyen
nhaplai: .asciiz "So phan tu phai la so duong\nNhap lai !!!!\n"
kq: .asciiz "So am lon nhat: "
vt: .asciiz "Vi tri: "
mess: .asciiz "Mang da cho khong co so am\n"

##################

# $s0 : addr A[0], $t0 bien phu khoi tao = s0
# S1: N so luong phan tu mang
# $v1 : result
# $s2: pos

##################
.text
	la $s0,A      #s0 = addr A[0]
	add $t0,$zero,$s0
get_num:
	#so luong phan tu
	li $v0, 5
 	syscall
 	blt $v0,0,error_get_num  # N < 0 -> bao loi
 	add $s1,$zero,$v0 #s1 = n ; so luong phan tu cua mang
 	li $t1,0 #index i =0
get_arr:
	beq $t1,$s1,end_get_arr  #i = N ->end, mang bdau tu 0
	#Nhap vao so
	li $v0, 5
 	syscall

 	sw $v0,0($t0) #luu gia tri vao dia chi A[i]
 	
 	addi $t1,$t1,1  #i = i+1
 	add $t0,$t0,4   #t0 = addr A[i+1]
 	j get_arr 
 	
 	
 error_get_num:
 	#N<0 - line 20
 	li $v0, 4
 	la $a0, nhaplai
 	syscall
 	
 	j get_num #goi lai nhap N
 end_get_arr:
 	li $v1,-999999 #khoi tao v1 la so am rat be
 	add $t0,$zero,$s0 #t0 = addr A[0]
 find_negMin:
 	li $t1,0 #i = 0
 	loop:
 		beq $t1,$s1,endFind #i = N, ket thuc tiem kiem
		lw $t3,0($t0)  #t3 = A[i]
		addi $t1,$t1,1 #i = i + 1
		add $t0,$t0,4  #t0 = addr A[i+1]
		blt $t3,0,sosanh  #t3 = A[i] <0 thi moi kiem tra
		j loop	
sosanh:
#neu t3 la so am, ??no co phai so am lon nhat khong?
		ble $t3,$v1,loop
		add $v1,$zero,$t3 #v1 = result
		
		addi $t7,$t1,-1		
		add $s2,$zero,$t7 #s2 = pos
		
		j loop
endFind:
# xu li va in ra ket qua
		beq $v1,-999999,noSol  #v1 = gtri ban dau-> mang ko co so am
		li $v0, 56 
 		la $a0, kq
 		la $a1, 0($v1) #
 		syscall # thong bao so am lon nhat
 		
 		add $s2,$s2,1
 		li $v0, 56 
 		la $a0, vt
 		la $a1, 0($s2) #
 		syscall # Vi tri
 		
 		j exit #thoat, het ctrinh
noSol:
		#mang toan so am, ko tim duoc ket qua can tim
		li $v0, 55
 		la $a0, mess
 		syscall
exit:
			