# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Avaliação 01 - Programação em Linguagem de Montagem
#Exercício 02
#Alunos: Ahmad Reiano Wahab e João Vitor Loch Martins


.text 

	addi $s0, $0, 0 #Atribui o valor 0 ao $s0
	addi $s1, $0, 10 #Atribui o valor 10 ao $s1
Loop:	addi $v0, $0, 1 #Atribui o valor 1 ao $v0, informado que vai imprimir um inteiro
	add $a0, $0, $s0 #Atribui o valor de $s0 ao $a0, que vai ser mostrado pelo syscall 
	syscall #Opera o syscall
	addi $s0, $s0, 1 #Adiciona 1 no valor do $s0 (i++)
	bne $s0, $s1, Loop #Verifica se o $s0 é igual a 10($s1), se não for, volta pro Loop
