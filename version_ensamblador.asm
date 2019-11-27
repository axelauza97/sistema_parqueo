.data  
    park: .word 0:20 # Arreglo de autos
    park_size: .word 19
    prompt1: .asciiz "Ingrese una opcion\n"
    prompt2: .asciiz "1.- Observar parqueos ocupados\n"
    prompt3: .asciiz "2.- Ingresar auto a parqueo\n"
    prompt4: .asciiz "3.- Retirar auto de parqueo\n"
    prompt5: .asciiz "4.- Salir\n"
    prompt6: .asciiz "Placa"
.text 
    la $s0, park # Cargo la dir del parqueo
    la $s1, park_size # Cargo la dir del size parqueo
    lw $s1, 0($s1) #Cargo size
    add $t0, $zero,$zero #opcion default 0
    
    while1:
        jal opcion
        add $t1,$zero,$v0 #Tomar salida de opcion
        
        add $a1,$s0,$zero #envio parametro para observar parqueo(dir)
        add $a2,$s1,$zero #envio parametro para observar parqueo(size)
        beq $v0,1,observar_parqueos
                
        beq $v0,2,ingresar_auto
        beq $v0,3,remover_auto
        beq $v0,4,EXIT
        j while1
            
observar_parqueos:
    add $t0,$zero,$zero #contador
    add $t2,$zero,$zero #ofset
    for:
        slt $t0,$a2,$t1
        bne $t1,1,ExitOP
        lw $s1,0($a1) #PLACA en s1
        li $s1,4
        la $a0,prompt6
        syscall
        add $t2,$t2,4 #avanzo el contador
        add $a1,$zero,$t2
        j for
    ExitOP:
        sub $a1,$a1,$t2 #Posicionar en origen array
        jr $ra

    
# Funcion ingresar autos
ingresar_auto:
    add $t0, $zero, $zero       # inicializar el bucle for en 0
        slt $t1, $t0, $a2            
         
        beq $t1, $zero, EXIT         # Verificar si hay un espacio disponible en cada registro del parking
        mul $t2, $t0, $a1
        beq $t2, $a3, asignar_auto   # Aumentar el contador en 1 si no hay disponibilidad
            addi $t0, $t0, 1
            addi $v0, $zero, 1
        asignar_auto:                    # Asingar auto en un espacio vacÃƒÂ­o 
            add $t2, $t2, $a0
            add $a1, $a1, $t2
            addi $v0, $zero, 0
            # llamar a funciones para imprimir a partir de aquÃƒÂ­
            j ExitIA
            ExitIA:
            jr $ra

remover_auto:
    add $t0, $zero, $zero       # inicializar el bucle for en 0
    slt $t1, $t0, $a2              
        beq $t1, $zero, EXIT         # Verificar si hay un espacio disponible en cada registro del parking
        mul $t2, $t0, $a1
        beq $t2, $a0, remover_auto   # Comparar el valor de la placa tomado en la entrada y almacenado en a0 para verificar si estÃƒÂ¡ en el registro
        addi $t0, $t0, 1
    addi $v0, $zero, 1
        j remover_auto                    # Liberar espacio 
            addi $t2, $t2, 0
            add $a1, $a1, $t2
            addi $v0, $zero, 0
            # llamar a funciones para imprimir a partir de aquÃƒÂ­
            j ExitRA
        ExitRA:
            jr $ra

opcion:
    li $v0, 4
    la   $a0, prompt1   # load address of prompt for syscall
    syscall            # print the prompt string
    li $v0, 4
    la   $a0, prompt2   # load address of prompt for syscall
    syscall            # print the prompt string
    li $v0, 4
    la   $a0, prompt3   # load address of prompt for syscall
    syscall            # print the prompt string
    li $v0, 4
    la   $a0, prompt4   # load address of prompt for syscall
    syscall
    li $v0, 4
    la   $a0, prompt5   # load address of prompt for syscall
    syscall
    li $v0, 5
    syscall # store answer
    jr $ra
EXIT:
    
