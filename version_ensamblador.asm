.data  
	park: .word 0:20 # Arreglo de autos
	park_size: .word 20 
    placa_base: .word 000000 
	prompt: .asciiz "Ingrese una opcion\n"
	prompt2: .asciiz "1.- Observar parqueos ocupados\n"
	prompt3: .asciiz "2.- Ingresar auto a parqueo\n"
	prompt4: .asciiz "3.- Retirar auto de parqueo\n"
  	prompt5: .asciiz "4.- Salir"
    prompt6: .asciiz "5.- Ingresando auto..."
.text 
	main:
        la $s0, park # Cargo la dir del parqueo
        la $s1, park_size # Cargo la dir del size parqueo
        lw $s1, 0($s1) # Cargo size
        lw $s2, placa_base 
        addi $t0, $zero,$zero
        syscall
        
        # considerando que
                    # addi $t3, $v1, 0			# guardar input
					# addi $a0, $t3, 0			# guardar valores para funcion	los argumentos corresponden a los arreglos y a la entrada de la placa							
					# addi $a1, $s0, 0          
					# addi $a2, $s1, 0
                    # addi $a3, $s2, 0

    # Funcion ingresar autos
    ingresar_auto:
            addi $t0, $zero, $zero       # inicializar el bucle for en 0
            slt $t1, $t0, $a2            
         
            beq $t1, $zero, EXIT         # Verificar si hay un espacio disponible en cada registro del parking
            mul $t2, $t0, $a1
            beq $t2, $a3, asignar_auto   # Aumentar el contador en 1 si no hay disponibilidad
               addi $t0, $t0, 1
               addi $v0, $zero, 1
        asignar_auto:                    # Asingar auto en un espacio vacío 
            add $t2, $t2, $a0
            add $a1, $a1, $t2
            addi $v0, $zero, 0
            # llamar a funciones para imprimir a partir de aquí
            j ExitIA
        ExitIA:
            jr $ra
            
  
	        	

    remover_auto:
            addi $t0, $zero, $zero       # inicializar el bucle for en 0
            slt $t1, $t0, $a2            
         
            beq $t1, $zero, EXIT         # Verificar si hay un espacio disponible en cada registro del parking
            mul $t2, $t0, $a1
            beq $t2, $a0, remover_auto   # Comparar el valor de la placa tomado en la entrada y almacenado en a0 para verificar si está en el registro
               addi $t0, $t0, 1
               addi $v0, $zero, 1
        remover_auto:                    # Liberar espacio 
            addi $t2, $t2, 0
            add $a1, $a1, $t2
            addi $v0, $zero, 0
            # llamar a funciones para imprimir a partir de aquí
            j ExitIA
        ExitIA:
            jr $ra

