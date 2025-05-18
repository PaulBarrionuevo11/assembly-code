; PUSH is the instruction of adding two instruction:
; 1. Substract -8 from rsp
; 2. Next, MOV [rsp] (destinatoin), rcx (source)

; POP is the instruction
; 1. MOV rax, [rsp] 
; 2. Add +8 to rsp


section .data

lst		dd		10, 20, 30, 40
EXIT_SUCCESS	equ		0
SYS_exit	equ		60

section .text
global _start
_start:

mov ecx, 4
mov eax, 0
mov r12, 0

pushLoop:
	push dword[lst+r12]
	add r12, 4	
	loop pushLoop
	
mov ecx, 4
mov r12, 0

popLoop:
	pop eax
	mov dword[lst+r12], eax
	add r12, 4
	loop popLoop
	
last:
mov 	rax, SYS_exit
mov	rdi, EXIT_SUCCESS
syscall
