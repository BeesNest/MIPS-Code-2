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
