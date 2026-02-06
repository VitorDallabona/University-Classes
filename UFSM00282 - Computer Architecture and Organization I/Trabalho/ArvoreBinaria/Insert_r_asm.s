#####################################
# NOMES:
#  - Maria Eduarda Barriquello 
#  - Vitor Dallabona
#####################################

.text
.globl Insert_r_asm
.ent Insert_r_asm

# struct Student *Insert_r (struct Student *subTreeRoot, struct Student *newStudent) {

# include <iregdef.h>

Insert_r_asm:
    addi sp, sp, -12 # aloca memoria na pilha
    sw ra, 8(sp) # endereco de retorno da main

    sw s1, 4(sp) # armazena *newStudent
    sw s0, 0(sp) # armazena *subTreeRoot

    # armazena os args nos registradores
    move s0, a0 # arg *subTreeRoot
    move s1, a1 # arg *newStudent

    # _if (subTreeRoot == NULL)
    beq s0, zero, if_corpo

    # _else if (newStudent->registration > subTreeRoot->registration)
    lw t0, 72(s1) # newStudent->registration
    lw t1, 72(s0) # subTreeRoot->registration

    # newStudent->registration > subTreeRoot->registration
    bgt t0, t1, elseif

    # _else

    # subTreeRoot->left
    lw a0, 152(s0)

    # newStudent
    move a1, s1

    # chama a funcao recursivamente
    jal Insert_r_asm

    # armazena em subTreeRoot->left
    sw v0, 152(s0)

    # retorna nó subTreeRoot
    move v0, s0

    j fim

if_corpo:
    # subTreeRoot = newStudent;
    move s0, s1

    # retorna nó subTreeRoot
    move v0, s0

    j fim

elseif:
    # subTreeRoot->right
    lw a0, 156(s0)

    # newStudent
    move a1, s1

    # chama a funcao recursivamente
    jal Insert_r_asm

    # armazena em subTreeRoot->right
    sw v0, 156(s0)

    # retorna nó subTreeRoot 
    move v0, s0

    j fim

fim:
    # desalocacao de memoria
    lw ra, 8(sp)

    lw s1, 4(sp)
    lw s0, 0(sp)

    # restaura a pilha
    addiu sp, sp, 12

    # retorno para a main
    jr ra

.end Insert_r_asm