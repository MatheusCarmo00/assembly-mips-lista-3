
.data
msg1: .asciiz "Digite um numero positivo: "
msg2: .asciiz "Maior valor: "
msg3: .asciiz "\nMenor valor: "

.text
.globl main
main:
    # Ler o primeiro numero valido
primeiro:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    blez $t0, primeiro

    # Inicializar maior e menor
    move $t1, $t0   # Maior
    move $t2, $t0   # Menor
    li $t3, 1       # Contador

ler:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # Repetir se nao for positivo
    blez $t0, ler

    # Atualizar maior
    bgt $t0, $t1, atualizar_maior
    j verificar_menor

atualizar_maior:
    move $t1, $t0

verificar_menor:
    blt $t0, $t2, atualizar_menor
    j continuar

atualizar_menor:
    move $t2, $t0

continuar:
    addi $t3, $t3, 1
    blt $t3, 10, ler

    # Mostrar maior
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    # Mostrar menor
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
