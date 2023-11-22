    segment .text
    global main
main:
    push rbp
    mov rbp, rsp
    mov rax,0x12345678
    shr rax,8 ; >> 2 bytes: rax=0x123456
    and rax, 0xff ; rax=0x56

    mov rax,0x12345678
    mov rdx,0xaa ; replacement field
    mov rbx,0xff ; mask
    shl rbx,8 ; 0xff00
    not rbx ; inverted mask = 0xffffffffffff00ff
    and rax,rbx ; rax=0x12340078
    shl rdx,8; rdx=0xaa00
    or rax,rdx ; 0x1234aa78

    xor rax,rax
    leave
    ret

; yasm -f elf64 -g dwarf2 -l bits1.lst bits1.asm
; gcc -o bits1 bits1.o