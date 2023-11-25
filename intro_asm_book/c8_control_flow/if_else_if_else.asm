        segment .data
a       dq      100
b       dq      200
c       dq      300
result  dq      0
        segment .text
        global  main
main:
        push    rbp
        mov     rbp, rsp
        mov     rax, [a]
        mov     rbx, [b]
        cmp     rax, rbx ; if (a<b)
        jnl     else_if
        mov     qword [result], 1 ; result=1
else_if mov     rcx, [c]
        cmp     rax, rcx ; else if (a>c)
        jng     else
        mov     qword [result], 2 ;result=2
        jmp     endif
else:   mov     qword [result], 3 ; else result=3
endif:  xor     eax, eax
        leave
        ret

; yasm -f elf64 -g dwarf2 -l if_else_if_else.lst if_else_if_else.asm
; gcc -no-pie -o if_else_if_else if_else_if_else.o
; gdb if_else_if_else