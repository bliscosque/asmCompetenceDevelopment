        segment .data
a       dq      100
b       dq      200
        segment .text
        global  main
main:
        push    rbp
        mov     rbp, rsp
        mov     rax, [a] ; rax=a
        mov     rbx, [b] ; rbx=b
        cmp     rax, rbx
        jge     in_order ;if (a<b)
        mov     [a], rbx ; a <=> b
        mov     [b], rax
in_order:
        xor     eax, eax
        leave
        ret

; yasm -f elf64 -g dwarf2 -l if.lst if.asm
; gcc -no-pie -o if if.o
; gdb if