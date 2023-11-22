; only exits
; output (exit code 5), check with $?

    segment .text ; segment=part of program / .text= where instructions go on linux
    global main ; _start is now a global label
main  ; label / where program starts (can also be main, called by _start)
    mov eax, 1 ; exit syscall
    mov ebx, 0 ; exit code 5
    int 0x80   ; execute the syscall

; yasm -f elf64 -g dwarf2 -l exit0_main.lst exit0_main.asm
; -f elf64 -> 64 bit object file
; -g dwarf2 -> produce debugging info
; -l exit.lst -> listing in exit.lst

; For programs with _start
; ld -o exit exit.o

; For programs with main
; gcc -o exit0_main exit0_main.o
