.data

mInicial:       .asciiz         "***************\n*** BIENVENIDO A LA CABINA TELEFONICA **\n****************\n"   

fmonInp:        .asciiz         "Ingrese Monedas: "
fmonErr:        .asciiz         "*-- MONEDA INCORRECTA --*\n"

fnumInp:        .asciiz         "\nIngrese el numero a llamar: "
fnumErr:        .asciiz         "*-- NUMERO INCORRECTO --*\n"

monTotal:       .asciiz         "Total: $ "
costPmin:       .asciiz         "Costo por minuto: $ "

fsimInit:       .asciiz         "Iniciar Llamada?    [ SI -> (1) ]    [ NO -> (0) ] : "
fsimCall:       .asciiz         "Llamada en curso... [ CONTINUAR -> (1) ] o [ TERMINAR -> (0) ]: "

durCall:        .asciiz         "Duracion de la llamada: "
costTotal:      .asciiz         "Costo de la llamada: $ "
cambio:         .asciiz         "Cambio: $ "

zerof:          .float          0.0
mione:          .float          -1.0
val_coin:       .float          0.05, 0.10, 0.25, 0.50, 1.00

phone:          .space          15

                .text

main:
# ************ INIT ************* #

    lwc1            $f30, zerof                 # $f30 = 0
    lwc1            $f31, mione                 # $f31 = -1
    # Float accumulator for deposited money
    add.s           $f2, $f30, $f30             # f1 = 0
    # Condicionals
    li		        $s0, 0		                # $s0 = 0 FALSE
    li		        $s1, 1		                # $s1 = 1 TRUE
    # Number of valid coins
    li		        $s2, 5		                # $s0 = 5
    # Address of valid coins array
    la		        $s3, val_coin		        #  
    # Phone number length
    li		        $s4, 15		                # $s4 = 15
      
    

# ********** WELCOME MESSAGE ********** #
    # Display Welcome Message
    li		        $v0, 4		                # $v0 = 4
    la		        $a0, mInicial		        # 
    syscall  


# *********** GET COINS *********** #
GET_MONEY:

    # Display "Ingrese Monedas: "
    li		        $v0, 4		                # $v0 = 4
    la		        $a0, fmonInp		        # 
    syscall   
    # Take float input from user
    li		        $v0, 6                      # $v0 = 6
    syscall 
    # If input == -1 end coin input
    c.eq.s          $f0, $f31                   # if $f0 == $f31 
    bc1t            GET_MONEY_END
    # Else Validate the coin
    jal		        VAL_COIN				    # jump to VAL_COIN and save position to $ra
    beq		        $v1, $s0, GET_MONEY_INV     # if $v1 == $s0 then I_COIN    
    add.s           $f2, $f2, $f0               # $f1 = $f1 + $f0
    j               GET_MONEY                   # jump to GET_MONEY

GET_MONEY_INV:
    # Display "*-- MONEDA INCORRECTA --*"
    li		        $v0, 4		                # $v0 = 4
    la		        $a0, fmonErr		        # 
    syscall
    j		        GET_MONEY                   # jump to GET_MONEY
           
GET_MONEY_END:

    # Display "Total: $ "
    li		        $v0, 4                      # $v0 = 4
    la		        $a0, monTotal               # 
    syscall   

    # Display sum of coins
    mov.s 	        $f12, $f2                   # $f12 = $f1
    li		        $v0, 2                      # $v0 = 2
    syscall
    j		        GET_NUMBER				    # jump to END_PROGRAM
    
    
# ********** VALIDATE COINS *********** #

VAL_COIN:
    li		        $t1, 0		                # $t1 = 0
    add	            $t2, $zero, $s3	            # $t2 = $zero + $s3
    
    
VAL_COIN_WHILE:
    beq		        $t1, $s2, VAL_COIN_I        # if $t1 == $s0 then END_VAL_COIN
    lwc1            $f3, 0($t2)                 # $f3 = Number of val_coin array
    c.eq.s          $f0, $f3                    # if $a0 == $f3
    bc1t            VAL_COIN_V  
    addi	        $t1, $t1, 1			        # $t1 = $t1 + 1
    addi	        $t2, $t2, 4			        # $t2 = $t2 + 4
    j		        VAL_COIN_WHILE				# jump to WHILE_VAL_COIN                    
    
VAL_COIN_I:
    li		        $v1, 0		                # $v1 = 0 invalid coin
    jr		        $ra					        # jump to $ra

VAL_COIN_V:
    li		        $v1, 1		                # $v1 = 1 valid coin
    jr		        $ra					        # jump to $ra   

# ********** GET PHONE NUMBER *********** #

 

# ********** TERMINAR PROGRAMA ********** #
END_PROGRAM: 
    li		        $v0, 17		                # $v0 = 17
    li		        $a0, 0		                # $a0 = 0
    syscall