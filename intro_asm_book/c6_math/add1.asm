    segment .data
a   dq  151
b   dq  310
sum dq  0

    segment .text
    global main

main:
    mov rax, 9
    add [rel a],rax ; a=160
    mov rax, [rel b]; rax=310
    add rax,10  ;rax=320
    add rax,[rel a] ;rax=480
    mov [rel sum], rax ;sum=480
    ret

; yasm -f elf64 -g dwarf2 -l add1.lst add1.asm
; gcc -o add1 add1.o