; ==========================
; Group member 01: Samvit_Prakash_u23525119
; Group member 02: Diya_Budhia_u22594044
; Group member 03: Alisha_Perumal_u22512285
; ==========================

section .bss
    ; ==========================
    choice db 0
    trash db 0
    s db 1
    ; ==========================

section .text
    global get_user_choice

extern greeting             

get_user_choice:
    ; Call the greeting function to print the welcome message
    call greeting

    ; ==========================
    mov rdx, s
    mov rsi, choice
    call input

    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing 
    ret

input:
    mov rax, 0
    mov rdi, 0
    syscall

    mov rsi, trash
    mov rdx, 1
    syscall
    ret