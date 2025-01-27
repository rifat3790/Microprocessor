NEWLINE MACRO
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
NEWLINE ENDM

PRINT MACRO STR
    MOV DX, OFFSET STR
    MOV AH, 9
    INT 21H
PRINT ENDM

PRINT_NUM MACRO NUM
    MOV AL, NUM
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H
PRINT_NUM ENDM

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "Enter a single digit number: $"
    MSG2 DB "Result: $"
    NUM DB ?
    RESULT DB ?
.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Prompt user for a number
    PRINT MSG1
    NEWLINE

    ; Get number from user
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV NUM, AL

    ; Check if the number is below 5
    CMP NUM, 5
    JGE NO_MULTIPLY

    ; If below 5, multiply by 2
    MOV AL, NUM
    MOV BL, 2
    MUL BL
    MOV RESULT, AL
    JMP DISPLAY_RESULT

NO_MULTIPLY:
    MOV AL, NUM
    MOV RESULT, AL

DISPLAY_RESULT:
    ; Print result
    PRINT MSG2
    NEWLINE
    PRINT_NUM RESULT
    NEWLINE

    ; Terminate program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN