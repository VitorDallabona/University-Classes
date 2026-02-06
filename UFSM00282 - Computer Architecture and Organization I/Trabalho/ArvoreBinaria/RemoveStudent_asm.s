#####################################
# NOMES:
#  - Maria Eduarda Barriquello 
#  - Vitor Dallabona
#####################################

# void RemoveStudent_asm(struct BinarySerachTree *bst, unsigned int registration)

# include <iregdef.h>

    .text
    .globl RemoveStudent_asm
    .ent RemoveStudent_asm


RemoveStudent_asm:
	addi sp, sp, -24 # aloca memoria na pilha
	sw ra, 20(sp) # endereco de retorno da main

	sw s4, 16(sp) # armazena left
	sw s3, 12(sp) # armazena *parent
	sw s2, 8(sp) # armazena *root
	sw s1, 4(sp) # armazena registration
	sw s0, 0(sp) # armazena *bst
	
	# copia os args para registradores
	move s0, a0 # arg *bst
	move s1, a1 # arg registration
	
	lw s2, 4(s0) # struct Student *root = bst->root;
	
while:
	# root != NULL
	beq s2, zero, fim
	
	# carrega root->registration
	lw t0, 72(s2)
	
	# registration == root->registration
	bne s1, t0, else_if_externo

	# _if interno
	# root == bst->root
	lw t1, 4(s0)
	
	# root == bst->root
	bne s2, t1, else_if_interno
	
	# DeleteSubTreeRoot(root)
	move a0, s2
	jal DeleteSubTreeRoot
	# v0 recebe o retorno da funcao
	
	# bst->root = DeleteSubTreeRoot(root)
	sw v0, 4(s0)
	
	# sai do if mais interno
	j continue


else_if_interno:
	# condicao do else if
	beq s4, zero, else_interno
	
	# parent->left = DeleteSubTreeRoot(root)

	# chamada da funcao DeleteSubTreeRoot
	move a0, s2
	jal DeleteSubTreeRoot
	# v0 recebe o retorno da funcao
	
	# salva o retorno da funcao em parent->left
	sw v0, 152(s3)
	
	j continue


else_interno:
	# parent->right = DeleteSubTreeRoot(root)
	
	# chamada da funcao DeleteSubTreeRoot
	move a0, s2
	jal DeleteSubTreeRoot
	# v0 recebe o retorno da funcao
	
	# salva o retorno da funcao em parent->right
	sw v0, 156(s3)
	
	j continue
	
	
continue:	
	# bst->size--
	# carrega bst->size
	lw t2, 0(s0)
	
	# faz size--
	addi t2, t2, -1
	
	# salva
	sw t2, 0(s0)
	
	# break
	j fim


else_if_externo:
	# registration < root->registration
	slt t1, s1, t0
	
	# se t1=0, entra no else mais externo
	beq t1, zero, else_externo

	# parent = root (parent = 0 + root)
	add s3, zero, s2 
	
	# root = root->left
	lw s2, 152(s2)
	
	#left = 1
	li s4, 1
	
	# retorna para o while
	j while 
		

else_externo:
	# parent = root (parent = 0 + root)
	add s3, zero, s2 
	
	# root = root->right
	lw s2, 156(s2)
	
	# left = 0
	li s4, 0
	
	# retorna para o while
	j while 
		
fim:
	# desalocacao de memoria
	lw ra, 20(sp) 
	lw s4, 16(sp) 
	lw s3, 12(sp) 
	lw s2, 8(sp)
	lw s1, 4(sp)
	lw s0, 0(sp)
	
	# restaura a pilha
	addi sp, sp, 24
	
	# retorno para a main
	jr ra
	

.end RemoveStudent_asm
