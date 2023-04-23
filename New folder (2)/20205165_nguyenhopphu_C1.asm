.data
string: .space 100
Message: .asciiz "La xau doi xung"
Message1: .asciiz "Khong la xau doi xung"
.text

#####################

# $a3 = addr of string str[0]
# $s1 + 1 = do dai xau
# $s0 =  length / 2
# $t4, $t5: str[i] va str[length-1-1]
#####################
#get_string
get_sting:
	li $v0, 8
 	la $a0, string
 	li $a1, 100
 	syscall
#khoi tao bien index t0 = 0, gan dia chi a0 = a3
#xu li xau qua $a3
init:
	add $a3,$zero,$a0
	li $t0,0
#lay do dai xau da nhap
get_length:
	add $t1,$t0,$a3
	lb $t2,0($t1)
	beq $t2, $zero, end_of_str # is null char? 
 	addi $t0, $t0, 1 # $t0 = $t0 + 1 -> i = i + 1
 	j get_length
#xu li do dai xau, de thuc hien vong lap
end_of_str:
	sub $t0,$t0,1 #do xau nhap vao tinh ki tu \n nen -1
	div $s0,$t0,2  #s0 = length /2
	add $s1,$t0,-1 #s1 = length -1
	li $t0,0 #gan lai t0 = 0 index cho loop
#loop: 
#endlopp khi index = length_string /2
#kiem tra string[i] co = string[length-1-i] khong
loop:
	bgt $t0,$s0,end_loop #end xau doi xung
	add $t1,$t0,$a3 #t1 = addr string[i]
	sub $t3,$s1,$t0
	add $t2,$t3,$a3 #t2 = addr string[length - 1-i]
	lb $t4,0($t1) 
	lb $t5,0($t2)
	bne $t4,$t5, end2 # khong = -> ko doi xung, ket thuc
	addi $t0,$t0,1 #index = index+1
	j loop
	
end_loop:
#in ra neu la xau doi xung
	li $v0, 59
 	la $a0, string
 	la $a1, Message 
 	syscall
 	j exit

end2:
#in ra neu khong phai la xau doi xung
	li $v0, 59
 	la $a0, string
 	la $a1, Message1 
 	syscall
exit:
