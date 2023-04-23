#Laboratory Exercise 3
.text
#abs $s0,$s1
li $s1, 5 #khoi tao s1
bgtz $s1,POS #branch POS neu s1>0
sub $s0,$zero,$s1 #s0 = 0-s1 
j EXIT #exit
POS:
add $s0,$zero,$s1 #s1>0, s0 = s1+0
EXIT:

#move $s0,$s1 -> s0 = s1
add $s0,$zero,$s1 #s0 = 0+s1
 
# not $t0,$s0
li $s0,4 #khoi tao cho s0
li $t0,0 #khoi tao cho t0
nor $s0,$s0,$t0 #or s0 v?i 0 -> chinh no, nor -> dao bit.

#ble $t1,$t2 = sub+blez
li $t1,4
li,$t2,3 #khoi tao 2 bien de ktra
sub $t3,$t1,$t2 #tinh sub
blez $t3,branch #check <= 0
j exit
branch:
li $s0,11 #kiem tra cho nhanh branch
exit:
