    segment .data
a   dq  3
b   dq  4
c   dq  5

    segment .text
    global main
main:
    mov rax, [rel a] ; rax=a
    imul rax, rax ; rax=a^2
    mov rdx, [rel b] ; rbx=b
    imul rdx, rdx ; rdx=b^2
    mov rcx, [rel c] ; rdx=c
    imul rcx,rcx ; rcx=c^2
    add rax, rdx ; rax=a^2+b^2
    sub rax, rcx ; rax=a^2+b^2-c^2 (se 0, é hipotenusa)
    ret

; yasm -f elf64 -g dwarf2 -l add1.lst test_pithagore.asm
; gcc -o test_pithagore test_pithagore.o