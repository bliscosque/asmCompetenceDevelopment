    section .data

msg: db "Hello, World", 0x0a, 0 ; \0 terminated

    section .text
    global main
    extern printf ; uses external C function printf

main:
    push rbp
    mov rbp, rsp
    lea rdi, [msg] ; 1st param for printf
    xor eax, eax ; 0 floating points param
    call printf

    xor eax, eax ; ret 0
    pop rbp
    ret

; yasm -f elf64 -g dwarf2 -l hello.lst hello.asm
; gcc -no-pie -o hello hello.o
; gdb hello