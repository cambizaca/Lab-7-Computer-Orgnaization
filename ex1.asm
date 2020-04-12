
.data
  AA:     .space 400  		# int AA[100]
  BB:     .space 400  		# int BB[100]
  CC:     .space 400  		# int CC[100]
  m:      .space 4   		# m is an int whose value is at most 10
                     		# actual size of the above matrices is mxm

      # You may add more variables here if you need to



.text

main:


#------- INSERT YOUR CODE HERE for main -------
#
#  Best is to convert the C program line by line
#    into its assembly equivalent.  Carefully review
#    the coding templates near the end of Lecture 8.
#

#  1.  First, read m (the matrices will then be size mxm).
  addi $v0, $0, 5 			#reads int
  la   $a0, m      	
  add	$8, $0, $v0			# copy m into $8
  
  mult	$8, $8				# multiply width * height
  mflo	$t1				#square of m in t1
   
#  2.  Next, read matrix A followed by matrix B.
  la $a1, AA
ReadAA:
  add $t2, $t2, $0 			#initialize counter as 0
  addi $s0, $0, 5 			#reads int
  syscall
  sw $s0, ($a1)
  addi $a1, $a1, 4
  addi $t2, $t2, 4
  bne $t1, $t2, ReadAA
  
  
  

#  3.  Compute matrix product.  You will need triple-nested loops for this.
#  4.  Print the result, one row per line, with one (or more) space(s) between
#      values within a row.
la $a1, AA
PrintCC:
  add $t2, $t2, $0 			#initialize counter as 0
  lw $t2, ($a1)
  addi 	$v0, $0, 1  			# system call 1 is for printing an integer
  add 	$a0, $0, $t2 			# bring the  from $t3 into $a0
  syscall
  addi $a1, $a1, 4
  addi $t2, $t2, 4
  bne $t1, $t2, PrintCC
  
  
#  5.  Exit.
#
#------------ END CODE ---------------


exit:                     # this is code to terminate the program -- don't mess with this!
  addi $v0, $0, 10      	# system call code 10 for exit
  syscall               	# exit the program



#------- If you decide to make other functions, place their code here -------
#
#  You do not have to use helper methods, but you may if you would like to.
#  If you do use them, be sure to do all the proper stack management.
#  For this exercise though, it is easy enough to write all your code
#  within main.
#
#------------ END CODE ---------------