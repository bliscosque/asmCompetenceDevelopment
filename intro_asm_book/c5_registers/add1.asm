    segment .data
a   dq  175
b   dq  4097 ; 64 bits

    segment .text
    global main
main:
    ; mov rax, [a] ; rax = a (value of a) //GERA UM ERRO DE PIE... substituindo por [rel a] e [rel b]
    mov rax, [rel a] ; rax = a
    add rax, [rel b] ;rax += b
    xor eax, eax
    ret

; yasm -f elf64 -g dwarf2 -l add1.lst add1.asm
; gcc -o add1 add1.o