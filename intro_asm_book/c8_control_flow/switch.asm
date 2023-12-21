; use unconditional jump as switch
    segment .data
switch: dq case0
        dq case1
        dq case2
        dq case3

i:      dq 2

    segment .text
    global main

main:
    push rbp
    mov rbp,rsp
    sub rsp,16

    mov rax,[i]
    lea rdx,[switch]
    jmp [rdx+rax*8]

case0: ;go if i==0
    mov rbx,100
    jmp end
case1: ;go if i==1
    mov rbx,101
    jmp end
case2: ;go if i==2
    mov rbx,102
    jmp end
case3: ;go if i==3
    mov rbp,103
    jmp end
end:
    xor eax,eax
    leave
    ret

; yasm -f elf64 -g dwarf2 -l switch.lst switch.asm
; gcc -no-pie -o switch switch.o
; gdb switch