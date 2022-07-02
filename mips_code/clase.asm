EVALUACION:
    li		$t0, -1		        # $t0 = 0
    li		$v0, 0 		        # $v0  = 0 
LOOP:
    addi	$t0, $t0, 1			# $t0 = $t0 + 1    
    beq		$t0, $a0, END_LOOP	# if $t0 == $a0 then END_LOOP
    srl		$t1, $t0, 2			# $t1 = $t0 >> 2
    ble		$t1, $t3, LOOP	    # if $t1 <= $t3 then LOOP
    add		$v0, $v0, $t0		# $s0 = $s0 + $t0
    j		LOOP				# jump to LOOP
    
END_LOOP:
    jr		$ra					# jump to $ra
    
    




li		$t1, 0		# $t1 = 0
addi	$t0, $t1, 1			# $t0 = $t1 + 1

add		$t0, $t1, $t2		# $t0 = $t1 + $t2

beq		$t0, $t1, LOOP	    # if $t0 == $t1 then LOOP

bgt		$t0, $t1, target	# if $t0 > $t1 then target

blt		$t0, $t1, target	# if $t0 < $t1 then target

ble		$t0, $t1, target	# if $t0 <= $t1 then target

bge		$t0, $t1, target	# if $t0 >= $t1 then target

sll		$t0, $t0, 1 		# $t0 = $t0 << 2    t0 * 2^2 = t0*4
sll		$t0, $t0, 4			# $t0 = $t0 << 4    t0 * 2^4 = t0*16

srl		$t0, $t0, 2			# $t0 = $t0 >> 2    t0 / 2^2 = t0/4













