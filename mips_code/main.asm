                .data

mInicial:       .asciiz         "*******************************************\n**** BIENVENIDO A LA CABINA TELEFONICA ****\n*******************************************\n"   
msSalir:        .asciiz         "\nIngrese [ -1 ] para dejar de añadir monedas\n\n"

fmonInp:        .asciiz         "Ingrese Monedas: "
fmonErr:        .asciiz         "*-- MONEDA INCORRECTA --*\n"

fnumInp:        .asciiz         "\nIngrese el numero a llamar: \t\t"
fnumErr:        .asciiz         "*-- NUMERO INCORRECTO --*\n"

monTotal:       .asciiz         "\nTotal: \t\t\t\t\t$ "
costPmin:       .asciiz         "\nCosto por minuto: \t\t\t$ "
totalMin:       .asciiz         "\n\nMinutos disponibles para hablar: \t"

fsimInit:       .asciiz         "Iniciar Llamada?    [ SI -> (1) ]    [ NO -> (0) ] : "
fsimCall:       .asciiz         "Llamada en curso... [ CONTINUAR -> (1) ] o [ TERMINAR -> (0) ]: "

durCall:        .asciiz         "Duracion de la llamada: "
costTotal:      .asciiz         "Costo de la llamada: $ "
cambio:         .asciiz         "Cambio: $ "

zerof:          .float          0.0
mione:          .float          -1.0
randh:          .float          100.0
val_coin:       .float          0.05, 0.10, 0.25, 0.50, 1.00

phone:          .space          15



                .text
# ********************************************************** #
# ********************** MAIN PROGRAM ********************** #
# ********************************************************** #

main:

    # FLOAT ZERO
    lwc1            $f30, zerof                 # $f30 = 0
    # FLOAT -1
    lwc1            $f31, mione                 # $f31 = -1
    # FLOAT 100
    lwc1            $f10, randh
    # FLOAT ACCUMULATOR FOR DEPOSITED MONEY
    add.s           $f2, $f30, $f30             # f1 = 0
    # FLAGS
    li		        $s0, 0		                # $s0 = 0 FALSE
    li		        $s1, 1		                # $s1 = 1 TRUE
    # NUMBER OF VALID COINS
    li		        $s2, 5		                # $s0 = 5
    # ADDRESS OF THE ARRAY WITH VALID COINS
    la		        $s3, val_coin		        #  
    # MAXIMUM PHONE NUMBER INDEX
    li		        $s4, 9		                # $s4 = 15
    # EQUIVALENT OF '\n' IN ASCII CODE
    li		        $s6, 10		                # $s6 = 10
    # INITIALIZE THE STACK POINTER
    li		        $sp, 0		                # $sp = 0
    
    # MAXIMUM NUMBER OF MINUTES     -->     $s7
   
    # RANDOM COST PER MINUTE        -->     $f29
    



    # DISPLAY WELCOME MESSAGE
    li		        $v0, 4		                # $v0 = 4
    la		        $a0, mInicial		        # 
    syscall  
    la		        $a0, msSalir		        # 
    syscall 

    jal		        GET_MONEY				    # jump to GET_MONEY and save position to $ra    
    jal		        GET_NUMBER				    # jump to GET_NUMBER and save position to $ra
    jal		        COST				        # jump to COST and save position to $ra

    # MAXIMUM NUMBER OF MINUTES

    div.s           $f28, $f2, $f29             # TOTAL MONEY / RANDOM COST PER MINUTE
    cvt.w.s         $f28, $f28
    mfc1            $s7, $f28

    # DISPLAY "Minutos disponibles para hablar: "
    li		        $v0, 4		                # $v0 = 4
    la		        $a0, totalMin		        # 
    syscall  

    li		        $v0, 1		                # $v0 = 1
    move 	        $a0, $s7		            # $a0 = $s7    
    syscall  

    jal		        CALL_SIMULATION				# jump to CALL_SIMULATION and save position to $ra
    


    j		        END_PROGRAM				    # jump to END_PROGRAM
    
    


# ********************************************************** #
# ************************ GET COINS *********************** #
# ********************************************************** #

GET_MONEY:

    # DISPLAY "Ingrese Monedas: "
    li		        $v0, 4		                # $v0 = 4
    la		        $a0, fmonInp		        # 
    syscall   
    # TAKE FLOAT ENTERED BY THE USER
    li		        $v0, 6                      # $v0 = 6
    syscall 
    # IF INPUT == -1 END COIN INPUT
    c.eq.s          $f0, $f31                   # if $f0 == $f31 
    bc1t            GET_MONEY_END

    # ELSE -> VALIDATE COIN ENTERED
    addi	        $sp, $sp, -4			    # $sp = $sp + -4
    sw		        $ra, 0($sp)		            #     
    jal		        VAL_COIN				    # jump to VAL_COIN and save position to $ra
    lw		        $ra, 0($sp)		            # 
    addi	        $sp, $sp, 4			        # $sp = $sp + 4

    beq		        $v1, $s0, GET_MONEY_INV     # if $v1 == $s0 then I_COIN    
    add.s           $f2, $f2, $f0               # $f1 = $f1 + $f0
    j               GET_MONEY                   # jump to GET_MONEY

GET_MONEY_INV:
    # DISPLAY "*-- MONEDA INCORRECTA --*"
    li		        $v0, 4		                # $v0 = 4
    la		        $a0, fmonErr		        # 
    syscall
    j		        GET_MONEY                   # jump to GET_MONEY
           
GET_MONEY_END:

    # DISPLAY "Total: $ "
    li		        $v0, 4                      # $v0 = 4
    la		        $a0, monTotal               # 
    syscall   

    mov.s 	        $f12, $f2                   # $f12 = $f1
    li		        $v0, 2                      # $v0 = 2
    syscall
    jr		        $ra					        # jump to $ra    
    
# ********************************************************** #
# ********************* VALIDATE COINS ********************* #
# ********************************************************** #

VAL_COIN:
    li		        $t1, 0		                # $t1 = 0
    add	            $t2, $zero, $s3	            # $t2 = $zero + $s3
    
VAL_COIN_LOOP:
    beq		        $t1, $s2, VAL_COIN_I        # if $t1 == $s0 then END_VAL_COIN
    lwc1            $f3, 0($t2)                 # $f3 = Number of val_coin array
    c.eq.s          $f0, $f3                    # if $a0 == $f3
    bc1t            VAL_COIN_V  
    addi	        $t1, $t1, 1			        # $t1 = $t1 + 1
    addi	        $t2, $t2, 4			        # $t2 = $t2 + 4
    j		        VAL_COIN_LOOP				# jump to WHILE_VAL_COIN                    
    
VAL_COIN_I:
    li		        $v1, 0		                # $v1 = 0 invalid coin
    jr		        $ra					        # jump to $ra

VAL_COIN_V:
    li		        $v1, 1		                # $v1 = 1 valid coin
    jr		        $ra					        # jump to $ra   


# ********************************************************** #
# ******************* GET PHONE NUMBER ********************* #
# ********************************************************** #

GET_NUMBER:
    # DISPLAY "Ingrese el numero a llamar: "
    li		        $v0, 4		                # $v0 = 4
    la		        $a0, fnumInp		        # 
    syscall

    # TAKE STRING ENTERED BY THE USER (PHONE NUMBER)
    li		        $v0, 8		                # $v0 = 8
    la		        $a0, phone		            # 
    li		        $a1, 15		                # $a1 = 15  size of the array
    syscall
    
    addi	        $sp, $sp, -4			    # $sp = $sp + -4
    sw		        $ra, 0($sp)		            #  
    jal		        VAL_PHONE                   # jump to VAL_NUM and save position to $ra
    lw		        $ra, 0($sp)		            # 
    addi	        $sp, $sp, 4			        # $sp = $sp + 4

    beq		        $v1, $s0, GET_NUMBER_I	    # if $v1 == $s0 then GET_NUMBER_I
    jr		        $ra					        # jump to $ra    
    
GET_NUMBER_I:  
    # DISPLAY  "*-- NUMERO INCORRECTO --*"
    li		        $v0, 4		                # $v0 = 4
    la		        $a0, fnumErr		        # 
    syscall
    j		        GET_NUMBER				    # jump to GET_NUMBER
    
 
# ********************************************************** #
# ******************** VALIDATE PHONE ********************** #
# ********************************************************** #

VAL_PHONE:
    li		        $t0, -1		                # $t0 = 0   letter counter        
    add		        $t1, $a0, $zero		        # $t1 = $a0 + $zero
    
VAL_PHONE_LOOP:
    addi	        $t0, $t0, 1			        # $t0 = $t0 + 1
    
    add		        $t2, $t0, $t1		        # $t1 = $t0 + $a0 pointer to letter
    bgt		        $t0, $s4, VAL_PHONE_I       # if $t0 > $s4 then VAL_NUM_I   if index > 9

    # CHECK IF THE CURRENT CHARACTER IS A NUMBER
    lb              $a0, 0($t2)                 #

    addi	        $sp, $sp, -4			    # $sp = $sp + -4
    sw		        $ra, 0($sp)		            #     
    jal		        VAL_NUMBER				    # jump to VAL_NUMBER and save position to $ra
    lw		        $ra, 0($sp)		            # 
    addi	        $sp, $sp, 4			        # $sp = $sp + 4

    # IF IT'S NOT A NUMBER --> VAL_PHONE_I (INVALID NUMBER)
    beq		        $v1, $s0, VAL_PHONE_I	    # if $v0 == $s0 then VAL_PHONE_I

    # ELSE IF IT'S THE 9TH CHARACTER --> CHECK IF THE NEXT ONE IS '\n'
    bne		        $t0, $s4, VAL_PHONE_LOOP	# if $t0 != $s4 then VAL_PHONE_LOOP
    lb              $t3, 1($t2)                 #
    bne		        $t3, $s6, VAL_PHONE_I	    # if $a0 != $s6 then VAL_PHONE_I

    li              $v1, 1                      # $v1 = 1 valid coin
    jr              $ra                         # jump to $ra    

VAL_PHONE_I:
    li              $v1, 0                      # $v1 = 0 invalid coin
    jr              $ra                         # jump to $ra

# ********************************************************** #
# ******************** VALIDATE NUMBER ********************* #
# ********************************************************** #

VAL_NUMBER:

    li		        $t3, 48		                # $t3 = 48  ascii 0
    li		        $t4, 57		                # $t4 = 57  ascii 9

    blt		        $a0, $t3, VAL_NUMBER_I      # if $a0 < $t3 then VAL_NUM_I
    bgt		        $a0, $t4, VAL_NUMBER_I      # if $a0 > $t4 then VAL_NUM_I
    li              $v1, 1                      # $v1 = 1 valid coin
    jr              $ra                         # jump to $ra

VAL_NUMBER_I:
    li              $v1, 0                      # $v1 = 0 invalid coin
    jr              $ra                         # jump to $ra

# ********************************************************** #
# ********************** RANDOM COST *********************** #
# ********************************************************** #

COST:
    # GENERATE RANDOM NUMBER BETWEEN 10 AND 40
    li		        $a1, 31		                # $a1 = 31   
    li		        $v0, 42		                # $v0 = 42
    syscall

    addi	        $t5, $a0, 10			    # $t5 = $a0 + 10

    # CONVERT THE NUMBER TO FLOATING POINT BETWEEN 0.10 AND 0.40
    mtc1            $t5, $f4
    cvt.s.w         $f4, $f4
    div.s           $f29, $f4, $f10             # $f29 = $f4 / $f10


    # DISPLAY "Costo por minuto: $ "
    li		        $v0, 4		                # $v0 = 4
    la		        $a0, costPmin		        # 
    syscall

    li		        $v0, 2		                # $v0 = 2
    add.s           $f12, $f29, $f30            # $f12 = $f29
    syscall

    jr		        $ra					        # jump to $ra

# ********************************************************** #
# ******************** CALL SIMULATION ********************* #
# ********************************************************** #

CALL_SIMULATION:




# ********************************************************** #
# ******************* TERMINAR PROGRAMA ******************** #
# ********************************************************** #

END_PROGRAM: 
    li		        $v0, 17		                # $v0 = 17
    li		        $a0, 0		                # $a0 = 0
    syscall




