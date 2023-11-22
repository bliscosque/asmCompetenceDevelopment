    segment .bss
set resq 10
    segment .text
    global main
main:
    push rbp
    mov rbp, rsp

    bts qword[set],4 ;bit 4 of set=1
    bts qword[set],7 ; 0b10010000
    bts qword[set],8 ; 0b110010000
    bts qword[set+8],12 ;bit 76 (8*8+12) (COMO VER ESSE BIT NO GDB???)

    xor rax,rax
    leave
    ret

; yasm -f elf64 -g dwarf2 -l bits2.lst bits2.asm
; gcc -no-pie -o bits2 bits2.o
; gdb bits2
