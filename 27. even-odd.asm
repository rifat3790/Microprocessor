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

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_MSG DB "Enter a number: $"
    EVEN_MSG DB "The number is even.$"
    ODD_MSG DB "The number is odd.$"
    NUM DB ?

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    PRINT PROMPT_MSG
    NEWLINE

    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV NUM, AL

    MOV AL, NUM
    TEST AL, 1
    JZ EVEN

    PRINT ODD_MSG
    NEWLINE
    JMP END_PROGRAM

EVEN:
    PRINT EVEN_MSG
    NEWLINE

END_PROGRAM:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
