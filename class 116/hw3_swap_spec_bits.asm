; Author: Paul Barrionuevo
; Description: 118- Intro to Assembly Lenguage Prog -  Homework 3
; Date: 2/28/2025

section .data
EXIT_SUCCESS	 equ 	0           ;Succesful opertion
SYS_exit 	     equ 	60          ;Call code to terminate

bMask           dd      0x00804000  ;Mask to swap the bits 14 and 23


section .text
global _start

_start:

mov rax, 1
xor rax, [bMask]
;jmp last

last:

; Exit program
mov rax, SYS_exit
mov rdi, EXIT_SUCCESS
syscall

