# minimum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the minimum value
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations
	enternum: .asciiz "Enter number:\n"
	min: .asciiz "Minimum: "
	nextnum: .asciiz "Enter the next number:\n"
    newline: .asciiz "\n"

#Text Area (i.e. instructions/code directive)
.text

main:
	li $v0, 4
	la $a0, enternum
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 4
	la $a0, enternum
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 4
	la $a0, enternum
	syscall
	li $v0, 5
	syscall
	move $t2, $v0

    #Check if inputs are correct
	#li $v0, 1
	#add $a0, $zero, $t0
	#syscall
	#add $a0, $zero, $t1
	#syscall
	#add $a0, $zero, $t2
	#syscall

	move $t3, $t0
	blt $t0, $t1, num1smaller
	j num2smaller

num1smaller:
	blt $t0, $t2, num1small
	j num3small

num2smaller:
	blt $t1, $t2, num2small
	j num3small

num1small:
	move $t3, $t0
	j print

num2small:
	move $t3, $t1
	j print

num3small:
	move $t3, $t2
	j print

print: 
	li $v0, 4
	la $a0, min
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	la $a0, newline
	li $v0, 4
	syscall
	j exit

	# TODO: Write your code here
    # You can have other labels expressed here, if you need to

exit:
	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation
