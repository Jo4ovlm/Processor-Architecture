# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Avaliação 01 - Programação em Linguagem de Montagem
#Exercício 03
#Alunos: Ahmad Reiano Wahab e João Vitor Loch Martins

.data 
	str1 : .asciiz "Entre com A["
	str2: .asciiz "]:"
	str3: .asciiz "\nO valor de A["
	vetor: .word 0, 0, 0, 0, 0, 0, 0, 0

.text 
	
	la $a1, vetor #Carrega o endereço base do vetor
	addi $s0, $0, 0 #Define o valor de i 
	addi $s1, $0, 8 #Define o valor de $s1 como 8 pra comparar no bne la em baixo
Loop:	addi $v0, $0, 4 #Da o valor 4 pro $v0, dando o comando de escrever string na tela pro syscall
	la $a0, str1  #Carrega a string "str1" no $a0 pro syscall mostrar na tela
	syscall  #Opera o syscall
	addi $v0, $0, 1 #Da o valor 1 pro $v0, dando o comando de escrever inteiro  na tela pro syscall
	add $a0, $0, $s0  #Carrega o valor do i($s0) no $a0 que vai ser mostrado na tela
	syscall  #Opera o syscall
	addi $v0, $0, 4 #Da o valor 4 pro $v0, dando o comando de escrever string na tela pro syscall
	la $a0, str2  #Carrega a string "str2" no $a0 pro syscall mostrar na tela
	syscall #Opera o syscall
	add $t0, $s0, $s0 #multiplica o valor de i por 2 (i+i)
	add $t0, $t0, $t0 #multiplica por 2 denovo pra fechar 4i (2i+2i)
	add $t0, $t0, $a1 #soma o valor relativo do i com o endereço base do vetor e armazena no $t0
	
	
	lw $t1, 0($t0) #Carrega o endereço de memoria da casa i do vetor
	addi $v0, $0, 5 #Da o valor 5 pro $v0, dando o comando de ler um inteiro pro syscall
	syscall #Opera o syscall
	add $s2, $0, $v0 #Grava o inteiro lido pelo syscall em $s2
	sw $s2, 0($t0) #Guarda o valor de $s2 na casa i do vetor
	
	addi $s0, $s0, 1 #Soma 1 pro i (i++)
	bne $s0, $s1 , Loop #Volta pro Loop enquanto i nao for 8
	addi $s0, $0, 0 #Reseta o valor de i para 0 pro proximo loop
Loop2:	add $t0, $s0, $s0 #multiplica o valor de i por 2 (i+i)
	add $t0, $t0, $t0 #multiplica por 2 denovo pra fechar 4i (2i+2i)
	add $t0, $t0, $a1 #soma o valor relativo do i com o endereço base do vetor e armazena no $t0
	lw $t1, 0($t0) #Carrega o valor que estava guardado na casa i do vetor no $t1
	addi $v0, $0, 4 #Da o valor 4 pro $v0, dando comando de escrever string na tela 
	la $a0, str3  #Carrega a string "str3" no $a0, pro syscall mostrar na tela
	syscall #Opera o syscall
	addi $v0, $0, 1 #Da o valor 1 pro $v0, dando o comando de escrever inteiro na tela
	add $a0, $0, $s0 #Da o valor de i pro $a0, pro syscall escrever na tela
	syscall #Opera o syscall
	addi $v0, $0, 4  #Da o valor 4 pro $v0, dando o comando de escrever string na tela
	la $a0, str2  #Carrega a string "str2" no $a0 pro syscall escrever na tela
	syscall #opera o syscall
	addi $v0, $0, 1 #Da o valor 1 pro $v0, dando o comando de escrever inteiro na tela
	add $a0, $0, $t1 #Carrega o valor armazenado em $t1 no $a0 pro syscall escrever na tela
	syscall #Opera o syscall
	addi $s0, $s0, 1 #Soma 1 pro i (i++)
	bne $s0, $s1 , Loop2 #Volta pro Loop enquanto i nao for 8
	
	
	
	
	
	
	
	
