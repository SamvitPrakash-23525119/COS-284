; ==========================
; Group member 01: Samvit_Prakash_u23525119
; Group member 02: Name_Surname_student-nr
; Group member 03: Alisha_Perumal_u22512285
; ==========================
section .data
    output dw "Enter values separated by whitespace and enclosed in pipes (|): "
    comp_1 dw ' ',0
    comp_2 dw '|',0
    input dw ""
    extract dw ""
    count db 0

section .bss
    

section .text
    global extractAndConvertFloats

extractAndConvertFloats:
    mov rax, 1          ; Outputing prompt text 
    mov rdi, 1
    mov rsi, output
    mov rdx, 64
    syscall

    mov rax, 0          ; Getting first two characters of string -> "|_"
    mov rdi, 0
    mov rsi, r9 
    mov rdx, 2
    syscall

    xor r13, r13
    xor r14, r14
    while:
        mov rax, 0      ; Getting next character inputted
        mov rdi, 0
        mov rsi, r10
        mov rdx, 1
        syscall

        mov al, [r10]   ; Checking if end of loop
        cmp al, [comp_2]
        je end_while

        mov al, [r10]   ; Moving to al register for cmp
        cmp al, [comp_1]; Seeing if captured char is " "
        jne else        ; if statement jmp

        if_begin:
            inc r14     ; Getting Number of values
        
        else:
            mov cl, [r10]           ; Putting user input into a memory slot
            mov al, [input+r13]
            mov al, cl
            mov [input+r13], al
            inc r13
    
        end_if:


        jmp while

end_while:

    mov rax, 0          ; Removing the enter apend from terminal
    mov rdi, 0
    mov rsi, r8
    mov rdx, 1
    syscall

    

    mov rax, 60
    mov rdi, 0
    syscall
    