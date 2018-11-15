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

    li $s0, 1                                   
    li $s1, 0                                   
    li $s4, 0                                   
    li $s6, 0                                   
    la $a0, filtered_input                      
    addi $a0, $a0, 4     

    loop:

    li $t5, 4
    beq $t5, $s4, loop_exit
    addi $s4, $s4, 1                            
    addi $a0, $a0, -1                          

    lb $t2, 0($a0)                              
    beqz $t2, loop                              

    li $a1, 10                                  
    beq $a1, $t2, loop

    li $s7, 32                                  
    beq $t2, $s7, handle_space     

    li $s6, 1

    li $t0, 47
    slt $t1, $t0, $t2
    slti $t4, $t2, 58
    and $s5, $t1, $t4                           
    addi $s3, $t2, -48                          
    li $t7, 1
    beq $t7, $s5, calculation

    li $t0, 64
    slt $t1, $t0, $t2
    slti $t4, $t2, 91
    and $s5, $t1, $t4                           
    addi $s3, $t2, -55                          
    li $t7, 1
    beq $t7, $s5, calculation     

    li $t0, 96
    slt $t1, $t0, $t2
    slti $t4, $t2, 123
    and $s5, $t1, $t4                           #if $t2 has value within range 97 and 122, $s5 will have 1, else 0
    addi $s3, $t2, -87                          # $s3 has required value used for calulation later
    li $t7, 1
    beq $t7, $s5, calculation                   # if $s5 already has 1, calculate the char's value from ASCII and skip other checks and branch to calculation
              


             