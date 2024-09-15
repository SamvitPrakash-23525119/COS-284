; ==========================
; Group member 01: Samvit_Prakash_u23525119
; Group member 02: Alisha_Perumal_u22512285
; Group member 03: Diya_Budhia_u22594044
; ==========================
segment .text
        global multiplyScalarToMatrix
        
multiplyScalarToMatrix:   
        xor r9, r9                      ; Setting r9 to 0 for comparisons
        cmp r9, rsi                     ; Comparing rsi to 0
        jz loop_row_end                 ; Goto end of code if rsi = 0 [rsi is the row paramater]

        xor r9, r9                      ; Setting r9 to 0 for comparisons [incase its value changed for whatever reason]
        cmp r9, rdx                     ; Comparing rdx to 0
        jz loop_row_end                 ; Goto end of code if rdx = 0 [rdx is the col paramater]

        xor r10, r10                    ; Setting Counter Variable to 0
        xor r11, r11                    ; Setting Counter Variable to 0

loop_row_begin:                         ; Start of Outer For Loop
        
        cmp r10, rsi                    ; Checking if r10 < rsi [rsi is the upper bound of the loop]
        jge loop_row_end                ; Goto end of outer loop if r10 >= rsi

loop_col_begin:                         ; Start of Inner Loop
        
        cmp r11, rdx                    ; Checking if r11 < rdx [rdx is the upper bound of the loop]
        jge loop_col_end                ; Goto end of inner loop if r11 >= rdx

        mov rax, [rdi+8*r10]            ; Setting rax to matrix[y] [Elements are 8 bytes] 

        movss xmm1, [rax+4*r11]         ; Setting xmm1 to matrix[y][x] [Elements are 4 bytes]                   

        mulss xmm1, xmm0                ; Multiplying matrix[y][x] by scalar [Resultant stored in xmm1]

        movss [rax+4*r11], xmm1         ; Setting matrix[y][x] to xmm1 [Resultant of scalar multiplication]


        inc r11                         ; Increasing the counter variable by 1
        jmp loop_col_begin              ; Goto start of inner loop

        loop_col_end:                   ; End of inner loop
                
        xor r11, r11                    ; Resetting the counter variable to 0 to prepare for next loop
        inc r10                         ; Increasing the counter variable by 1
        jmp loop_row_begin              ; Goto start of outer loop
        
loop_row_end:                           ; End of outer loop

        ret                             ; return

