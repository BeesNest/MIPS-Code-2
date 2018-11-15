.data

    input_too_long:
    .asciiz "Input is too long."
    input_is_empty:
   .asciiz "Input is empty."
    invalid_number:
    .asciiz "Invalid base-36 number."
    input_storage:
    .space 2000
    filtered_input:                             
    .space 4

.text
main:

    la $a0, input_storage                       
    li $v0, 8                                   
    syscall

 
    li $s2, 0                                   
    li $t1, 10                                  
    li $t2, 32

    filter_loop:
    lb $t0, 0($a0)                              
    beq $t0, $t1, exit_filter_loop              
    beq $t0, $t2, skip                          
    beqz $t0, exit_filter_loop                  

    bne $s2, $zero, print_more_than_four       
    li $s2, 1                                   
    la $a1, filtered_input                      
    sb $t0, 0($a1)
    lb $t0, 1($a0)
    sb $t0, 1($a1)

    lb $t0, 2($a0)
    sb $t0, 2($a1)
    lb $t0, 3($a0)
    sb $t0, 3($a1)
    addi $a0, $a0, 3

    skip:
    addi $a0, $a0, 1
    jal filter_loop
    
    exit_filter_loop:
    beqz $s2, print_empty
