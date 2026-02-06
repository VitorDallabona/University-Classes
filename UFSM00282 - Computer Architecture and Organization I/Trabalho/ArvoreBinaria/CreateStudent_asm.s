#####################################
# NOMES:
#  - Maria Eduarda Barriquello 
#  - Vitor Dallabona
#####################################

.text
.globl CreateStudent_asm
.ent CreateStudent_asm

# struct Student *CreateStudent_asm(char *name, unsigned int birthday, char *course, unsigned int registration, char *hometown)

# include <iregdef.h>


CreateStudent_asm:
	# alocacao para o stack frame
	addiu sp, sp, -44 # sete palavras e reservado
	
	# stack
	sw ra, 24(sp) # endereco de retorno
	sw s5, 20(sp) # pointeiro *newStudent
	sw s4, 16(sp) # char *hometown
	sw s3, 12(sp) # unsigned int registration
	sw s2, 8(sp) # char *course
	sw s1, 4(sp) # unsigned int birthday
	sw s0, 0(sp) # char *name
	
	# salvamento dos argumentos
	move s0, a0 # name
	move s1, a1 # birthday
	move s2, a2 # course
	move s3, a3 # registration
	
	# salvamento do quinto argumento
	# depois da area reservada
	lw s4, 60(sp) # hometown
	
	
	# newStudent = (struct Student *)malloc(sizeof(struct Student));
	# sizeof(struct Student)
	li a0, 160 # tamanho 160
	jal malloc
	
	# s5 = v0 (retorno)
	add s5, zero, v0
	
	# strcpy(newStudent->name, name);
	# argumentos
	add a0, zero, s5 # newStudent->name
	add a1, zero, s0 # name
	
	jal strcpy
	
	# newStudent->birthday = birthday;
	sw s1, 112(s5)
	
	# strcpy(newStudent->course, course);
	# argumentos
	addiu a0, s5, 76 # newStudent->course
	add a1, zero, s2 # course
	
	jal strcpy
	
	# newStudent->registration = registration;
	sw s3, 72(s5)
	
	# strcpy(newStudent->hometown, hometown);
	# argumentos
	addiu a0, s5, 116 # newStudent->hometown
	add a1, zero, s4 # hometown
	
	jal strcpy
	
	# newStudent->left = NULL;
	sw zero, 152(s5)
	
	# newStudent->right = NULL;
	sw zero, 156(s5)
	
	# return newStudent;
	add v0, zero, s5
	
	
	# desalocacao
	lw ra, 24(sp)
	lw s5, 20(sp)
	lw s4, 16(sp)
	lw s3, 12(sp)
	lw s2, 8(sp)
	lw s1, 4(sp)
	lw s0, 0(sp)
	
	addiu sp, sp, 44
	
	# retorno
	jr ra
	
.end CreateStudent_asm