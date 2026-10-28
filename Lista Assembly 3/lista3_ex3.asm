
.data
msg1: .asciiz "Digite o primeiro valor: "
msg2: .asciiz "Digite o segundo valor: "
msg3: .asciiz "Diferenca: "

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

    # Comparar os valores
    bgt $t0, $t1, primeiro_maior

    sub $t2, $t1, $t0
    j mostrar

primeiro_maior:
    sub $t2, $t0, $t1

mostrar:
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
