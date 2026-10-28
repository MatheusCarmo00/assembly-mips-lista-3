
.data
msg1: .asciiz "Digite a nota: "
msg2: .asciiz "Media inteira: "
aprovado: .asciiz "\nAPROVADO"
exame: .asciiz "\nEXAME"
retido: .asciiz "\nRETIDO"

.text
.globl main
main:
    li $t0, 0       # Soma das notas
    li $t1, 0       # Contador

ler_nota:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall

    add $t0, $t0, $v0
    addi $t1, $t1, 1

    blt $t1, 4, ler_nota

    # Mostrar media inteira
    li $t2, 4
    div $t0, $t2
    mflo $t3

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Soma >= 24 equivale a media >= 6
    bge $t0, 24, situacao_aprovado

    # Soma >= 12 equivale a media >= 3
    bge $t0, 12, situacao_exame

    j situacao_retido

situacao_aprovado:
    li $v0, 4
    la $a0, aprovado
    syscall
    j fim

situacao_exame:
    li $v0, 4
    la $a0, exame
    syscall
    j fim

situacao_retido:
    li $v0, 4
    la $a0, retido
    syscall

fim:
    li $v0, 10
    syscall
