#Laboratory Exercise 5
.text
li $s1,8 #so nh�n, b?i c?a 2
li $s0,2 #s0=1, s? nh�n
li $s2,0 #dem so bit d?ch
li $t1,1 # temp var,beq
loop: 
beq $s1, $t1, endloop #dung khi s? nh�n s1 = 1
add $s2,$s2,1 	#dem +1
srl $s1,$s1,1 #s1 / 2
j loop # goto loop
endloop:
sllv $s1,$s0,$s2 #s1=s0*2^s2