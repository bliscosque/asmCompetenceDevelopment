    segment .data
; varName   dataType    initialVal
a   dd  4 ; 32 bits = 4 bytes
b   dd  4.4 ; 0x408ccccd = 32bit float
c   times   10 dd 0
d   dw  1,2 ; double word = 2 bytes
e   db  0xfb
f   db  "hello world",0

    segment .bss
g   resd    1 ; reserves 1dw  = 4 bytes
h   resd    10 ; reserves 10dw = 40 bytes
i   resb    100 ; reserves 100 bytes

    segment .text
    global main
main:
    push rbp ; setup stack frame for main
    mov rbp, rsp ; let rbp point to the previous ssp
    sub rsp, 16 ; leave some room for local vars and align stack to 16 byte boundary
    xor eax, eax ; rax=0 (ret value)
    leave ; undo stack manipulations
    ret

; yasm -f elf64 -g dwarf2 -l memory.lst memory.asm
; gcc -o memory memory.o