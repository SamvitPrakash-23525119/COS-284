; ==========================
; Group member 01: Samvit_Prakash_u23525119
; Group member 02: Diya_Budhia_u22594044
; Group member 03: Alisha_Perumal_u22512285
; ==========================
   
section .data
    sChoice db "Choice: "

section .bss
    ; ==========================
    choice db 0
    trash db 0
    ; ==========================

section .text
    global get_user_choice, input

extern greeting             

get_user_choice:
    call greeting             ; Call the greeting function to print the welcome message
    
    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor 1 is stdout
    mov rsi, sChoice          ; address of the string
    mov rdx, 8                ; length of the string ("Choice: " + newline)
    syscall

    mov rax, choice
    mov rdx, 1
    call input  

    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing 
    ret

input:
    mov rax, 0
    mov rdi, 0
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, trash
    mov rdx, 1
    syscall

    ret
