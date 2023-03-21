# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Avaliação 01 - Programação em Linguagem de Montagem
#Exercício 01
#Alunos: Ahmad Reiano Wahab e João Vitor Loch Martins


.data
	x : .asciiz  "Entre com o valor de X\n"
	y: .asciiz  "Entre com o valor de Y\n"
	result: .asciiz  "O resultado é:\n"
.text

	addi $v0, $0, 4 #Da o valor "4" pro $v0, sinalizando escrever string na tela
	la $a0, x #Da um load adress na string "x" , pra ela ser mostrada via syscall
	syscall #Opera o syscall 
	addi $v0, $0, 5 #Da o valor "5" pro $v0, sinalizando ler inteiro
	syscall #Opera o syscall
	add $s0, $0, $v0 #Grava o inteiro lido pelo syscall, que estava no $v0, no $s0
	addi $v0, $0, 4 #Da o valor "4" pro $v0, sinalizando escrever string na tela
	la $a0, y #Da um load adress na string "y" , pra ela ser mostrada via syscall
	syscall #Opera o syscall
	addi $v0, $0, 5 #Da o valor "5" pro $v0, sinalizando ler inteiro
	syscall #Opera o syscall
	add $s1, $0, $v0 #Grava o inteiro lido pelo syscall, que estava no $v0, no $s1
	add $s1, $s1, $s0 #soma o X com o Y ($s0 e $s1) e grava no $s1
	addi $v0, $0, 4 #Da o valor "4" pro $v0, sinalizando escrever string na tela
	la $a0, result #Da um load adress na string "result" , pra ela ser mostrada via syscall
	syscall #Opera o syscall
	addi $v0, $0, 1 #Da um valor "1" pro $v0, sinalizando escrever inteiro
	add $a0, $0, $s1 #Poe o valor desejado ($s1) no $a0, ja que ele que sera mostrado
	syscall #opera o syscall
