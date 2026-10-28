
.data
msg1: .asciiz "Digite o primeiro valor: "
msg2: .asciiz "Digite o segundo valor: "
msg3: .asciiz "Soma dos impares: "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    # Identificar menor e maior
    ble $t0, $t1, ordem_certa

    move $t2, $t1
    move $t3, $t0
    j iniciar

ordem_certa:
    move $t2, $t0
    move $t3, $t1

iniciar:
    move $t4, $t2   # Numero atual
    li $t5, 0        # Soma
    li $t6, 2        # Divisor

repetir:
    # Verificar se o numero e impar
    rem $t7, $t4, $t6
    beq $t7, $zero, pular

    add $t5, $t5, $t4

pular:
    addi $t4, $t4, 1
    ble $t4, $t3, repetir

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 10
    syscall
