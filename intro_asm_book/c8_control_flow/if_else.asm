        segment .data
a       dq      100
b       dq      200
max     dq      0
        segment .text
        global  main
main:
        push    rbp
        mov     rbp, rsp

        mov     rax, [a]
        mov     rbx, [b] 
        cmp     rax, rbx ; if(a<b)
        jnl     else
        mov     [max], rbx ; max=b
        jmp     endif
else:   mov     [max], rax ; else max=a
endif:  xor     eax, eax
        leave
        ret

; yasm -f elf64 -g dwarf2 -l if_else.lst if_else.asm
; gcc -no-pie -o if_else if_else.o
; gdb if_else