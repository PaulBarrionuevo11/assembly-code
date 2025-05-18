section .data
SYS_exit        equ     60
EXIT_SUCCESS    equ     0

pthreadID0      dq      0
pthreadID1      dq      0
mutex           dq      0
myValue         dq      1000
x               dq      2
y               dq      3
MAX             equ     100

section .text
extern pthread_create, pthread_join, pthread_mutex_init, pthread_mutex_lock, pthread_mutex_unlock
global _start

_start:
    ; Initialize mutex
    mov     rdi, mutex
    mov     rsi, 0
    call    pthread_mutex_init

    ; Create thread 0
    mov     rdi, pthreadID0
    mov     rsi, 0
    mov     rdx, threadFunction0
    mov     rcx, 0
    call    pthread_create

    ; Create thread 1
    mov     rdi, pthreadID1
    mov     rsi, 0
    mov     rdx, threadFunction0  ; Same function for simplicity
    mov     rcx, 0
    call    pthread_create

    ; Join thread 0
    mov     rdi, [pthreadID0]
    mov     rsi, 0
    call    pthread_join

    ; Join thread 1
    mov     rdi, [pthreadID1]
    mov     rsi, 0
    call    pthread_join

    ; Exit
    mov     rax, SYS_exit
    mov     rdi, EXIT_SUCCESS
    syscall

threadFunction0:
    push    rbp
    mov     rbp, rsp

    mov     rcx, MAX
    shr     rcx, 1
    mov     r10, [x]
    mov     r11, [y]

    cmp     r10, 0
    je      .end

incLoop0:
    mov     rdi, mutex
    call    pthread_mutex_lock

    mov     rax, [myValue]
    cqo
    div     r10
    add     rax, r11
    mov     [myValue], rax

    mov     rdi, mutex
    call    pthread_mutex_unlock

    loop    incLoop0

.end:
    mov     rsp, rbp
    pop     rbp
    ret