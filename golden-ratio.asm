.data
goldenratio:  .float 1.618 #mathematical concept in which 2 values are this proportion
length: .float 0.0  #will be calculated later as b
width: .float 0.0 # input by user
prompt: .asciiz "Enter the length of the frame (in feet): "
msg: .asciiz "To observe the Golden Ratio, you will need "
msg2: .asciiz " feet for the frame's length." 
# Information concerning the golden ratio was found via wikipedia and MS Copilot
.globl main
.text 

main:
la $a0, prompt
li $v0, 4
syscall
li $v0, 6
syscall
mtc1 $v0, $f12
cvt.s.w $f0, $f12
la $v0, goldenratio
mtc1 $v0, $f2
jal calc
la $a0, msg
li $v0, 4
syscall
la $a0, length
li $v0, 2
syscall
la $a0, msg2
li $v0, 4
syscall
li $v0, 10
syscall

calc: 
mul.s $f1, $f0, $f2
la $t1, length
swc1 $f1, 0($t1)
jr  $ra
