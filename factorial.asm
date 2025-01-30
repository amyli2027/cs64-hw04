# factorial.asm program
# CS 64, Z.Matni
#
# Assembly (NON-RECURSIVE) version of:
#   unsigned int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++)
#       fn = fn * x;
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";

#Data Area (i.e. memory setup directive)
.data
	string1: .asciiz	"Enter a number:\n"
	string2: .asciiz "Factorial of "
	string3: .asciiz " is:\n"
	newline: .asciiz "\n"
	# TODO: Write the rest of the initializations here

#Text Area (i.e. instructions/code directive)
.text
main:

	li $v0, 4
	la $a0, string1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	
	#check input
	#li $v0, 1
	#move $a0, $t0 
	#syscall

	move $t3, $t0 #For printing out later
	li $t1, 1 #Store answer
	li $t2, 1 #BEQ check
loop: 
	blt $t0, $t2, printResult
	mult $t1, $t0
	mflo $t1
	sub $t0, $t0, $t2
	j loop


printResult:
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, string3
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	j exit
	# TODO: Write your code here

exit:
	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation
