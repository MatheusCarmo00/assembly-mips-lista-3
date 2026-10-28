
.data
msg1: .asciiz "Digite o raio: "
msg2: .asciiz "Comprimento: "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # C = 6 * raio
    li $t1, 6
    mul $t2, $t0, $t1

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
