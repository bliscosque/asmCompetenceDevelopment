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

    mov rax, 76 ; bits 3,4,7 - 0b1001100
    mov rbx, rax
    shr rbx,6 ; 0b1
    mov rcx,0x3f ; 6 bits da direita - 0x111111
    xor edx,edx ; edx=0
    lea rsi,[set]
    bt [rsi+8*rbx],rcx ; test bit
    bt [set+8*rbx],rcx ; another way... 
    setc dl ;receive tested bit

    bts [rsi+8*rbx],rcx ;set bit in "set" 10000000100000000011100
    btr [rsi+8*rbx],rcx ;unset            10000000100000000011100

    xor rax,rax
    leave
    ret

; yasm -f elf64 -g dwarf2 -l bits2.lst bits2.asm
; gcc -no-pie -o bits2 bits2.o
; gdb bits2
