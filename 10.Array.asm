.MODEL SMALL
.STACK 100H
.DATA
A DB 1, 2, 1, 1, 1  
B DB 5 DUP(0)
C DB 5 DUP(?)
D DB ?
STR DW "Enter your number: $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
   
    ; MOV DX, OFFSET STR
    ; MOV AH, 9h
    ; INT 21H
   
    ; MOV AH, 1
    ; INT 21H
    ; SUB AX, 30H
     
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H

    MOV AX, 0
    MOV SI, 0
    ;MOV SI, OFFSET A
    MOV CX, 0
    MOV CL, 5

    LOOP1:
    ADD AL, A[SI]
    ;ADD AL, [SI]
    INC SI
    LOOP LOOP1

    MOV DX, 0
    MOV DL, AL
    ADD DL, 30H
    MOV AH, 2
    INT 21H


    MAIN ENDP
END MAIN