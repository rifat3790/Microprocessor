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
    DIV5_MSG DB "The number is divisible by 5.$"
    NOT_DIV5_MSG DB "The number is not divisible by 5.$"
    DIV10_MSG DB "The number is also divisible by 10.$"
    NOT_DIV10_MSG DB "The number is not divisible by 10.$"
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
    MOV AH, 0
    MOV BL, 5
    DIV BL
    CMP AH, 0
    JNE NOT_DIVISIBLE_BY_5

    PRINT DIV5_MSG
    NEWLINE

    MOV AL, NUM
    MOV AH, 0
    MOV BL, 10
    DIV BL
    CMP AH, 0
    JNE NOT_DIVISIBLE_BY_10

    PRINT DIV10_MSG
    NEWLINE
    JMP END_PROGRAM

NOT_DIVISIBLE_BY_10:
    PRINT NOT_DIV10_MSG
    NEWLINE
    JMP END_PROGRAM

NOT_DIVISIBLE_BY_5:
    PRINT NOT_DIV5_MSG
    NEWLINE

END_PROGRAM:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN