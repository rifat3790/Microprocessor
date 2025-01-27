.MODEL SMALL
.STACK 100H
.DATA
A DB 6  
B DB ?
C DB ?
D DB ?
STR DW "Enter your number: $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
   
    MOV DX, OFFSET STR
    MOV AH, 9h
    INT 21H
   
    MOV AH, 1
    INT 21H
    SUB AX, 30H
   
    MOV B, AL
    MOV AX, 0
    MOV AL, A
    div B
    MOV C, AL
    MOV D, AH
     
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
   
    MOV DL, 0
    MOV DL, C
    ADD DL, 48
    MOV AH, 2h
    INT 21H  
   
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
   
    MOV DL, 0  
    MOV DL, D
    ADD DL, 48
    MOV AH, 2h
    INT 21H
   
    MAIN ENDP
END MAIN