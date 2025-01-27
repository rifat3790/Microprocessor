PRINT MACRO STRING
    MOV DX, OFFSET STRING
    MOV AH, 9
    INT 21H
PRINT ENDM


.MODEL SMALL
.STACK 100H
.DATA
    MSG1        DB "Enter the starting number: $"
    MSG2        DB "Enter the ending number: $"
    PRIME_MSG   DB "Prime numbers: $"
    INPUT_START DW ?
    INPUT_END   DW ?
.CODE
MAIN PROC
                MOV   AX, @DATA
                MOV   DS, AX

    ; Prompt for starting number
                PRINT MSG1
                CALL  SCAN_NUM
                MOV   INPUT_START, AX

    ; Prompt for ending number
                PRINT MSG2
                CALL  SCAN_NUM
                MOV   INPUT_END, AX

                PRINT PRIME_MSG

    ; Initialize
                MOV   BX, INPUT_START

    CHECK_PRIME:
                MOV   CX, 2
                MOV   DX, 0

    DIV_LOOP:   
                MOV   AX, BX
                DIV   CX
                CMP   DX, 0
                JE    NOT_PRIME
                INC   CX
                CMP   CX, BX
                JNE   DIV_LOOP

    ; If Prime, Print the Number
                CALL  PRINT_NUM

    NOT_PRIME:  
                INC   BX
                CMP   BX, INPUT_END
                JLE   CHECK_PRIME
    
    
SCAN_NUM PROC
                XOR   CX, CX             ; Clear CX to store the number
    SCAN_LOOP:  
                MOV   AH, 1              ; Read a character from the keyboard
                INT   21H
                CMP   AL, 13             ; Check for Enter key (carriage return)
                JE    DONE               ; If Enter is pressed, end input
                SUB   AL, '0'            ; Convert ASCII to binary
                IMUL  CX, 10             ; Multiply previous number by 10
                ADD   CX, AX             ; Add current digit to CX
                JMP   SCAN_LOOP          ; Repeat for next digit
    DONE:       
                RET
SCAN_NUM ENDP


    ; End Program
                MOV   AH, 4CH
                INT   21H
MAIN ENDP
END MAIN
