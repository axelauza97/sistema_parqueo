
#for (i=0; i<a:i++)
#	for (j=0; j<b: j++)
		D[4*j]= i+j

#a -> $s0
#b -> $s1
#i -> $t0
#j -> $t1
#D -> $s2

#placa -> $t0
#max_auto -> $t1
#0 -> $t2


max_auto: .word 10
placa_base: .word 000000


main:
	#Funcion ingresar autos
	#inicializacion de parametros
ingresar_auto:
	addi $sp, $sp,-8  
	sw $t1, 4($sp)
	sw $t0, 0($sp)
	addi $t2, $zero, $zero
	slti $t3, $t2, max_auto
Loop1: 
	beq $t3, $zero, EXIT
	mul $t4, $t1, $t2
	bne $t4, placa_base, L1
	add $t5, $t5, $t0
	add $t4, $t4, $t5
L1:
	addi $t2, $t2, 1
	lw $t1,0($sp)
	lw $t1,4($sp)
	addi $sp, $sp, 8
	
#Funcion remover autos

remover_auto:
	addi $sp, $sp,-8  
	sw $t1, 4($sp)
	sw $t0, 0($sp)
	addi $t2, $zero, $zero
	slti $t3, $t2, max_auto
Loop2: 
	beq $t3, $zero, EXIT
	mul $t4, $t1, $t2
	bne $t4, $t0, L1
	add $t5, $t5, placa_base
	add $t4, $t4, $t5
L2:
	addi $t2, $t2, 1
	lw $t1,0($sp)
	lw $t1,4($sp)
	addi $sp, $sp, 8
exit:

