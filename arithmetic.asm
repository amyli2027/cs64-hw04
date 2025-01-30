# arithmetic.asm program
# CS 64, Z.Matni
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 64*( 4*b – a) + 5*c using only one mult instruction
# 3. Print out the result

.text
main:
	# TODO: Write your code here!
	li $v0, 5
	syscall
	add $t0, $zero, $v0
	li $v0, 5
	syscall
	add $t1, $zero, $v0
	5li $v0, 
	syscall
	add $t2, $zero, $v0

	#testing if inputs are correct
	#add $t2, $zero, $v0 
	#add $a0, $t1, $t2
	#add $a0, $a0, $t0
	#li $v0, 1
	#syscall

	#Do 64*(4*b-a)+5c or 64*(4*t1-t0)+5t2 
	sll $t1, $t1, 2
	sub $t1, $t1, $t0
	sll $t1, $t1, 6
	li $t4, 5
	mult $t2, $t4
	mflo $t2
	add $a0, $t1, $t2
	li $v0, 1
	syscall
	j exit

exit:
	# Exit SPIM: Write your code here!
	li $v0, 10
	syscall

