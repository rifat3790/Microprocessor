.MODEL SMALL
.STACK 100H
.DATA
A DB 1,2,1,1,1  
B DB 5 DUP(0)
C DB 5 DUP(?)
D DB ?
STR DW "Enter your number: $"    
STR1 DW "The result is: $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX  
   
    MOV DX, OFFSET STR
    MOV AH, 9h
    INT 21H
     
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
   
    MOV CX,0
    MOV CL,5
    MOV SI,0  
    MOV AX,0
   
    INPUT:
    MOV AH,1
    INT 21H
    SUB AL,30H  
    MOV C[SI],AL
    INC SI
    LOOP INPUT
   
   
   
    MOV AX,0
   
    ;MOV SI, OFFSET A
    MOV CX,0
    MOV CL,5
    MOV SI,0
   
    LOOP1:
    ADD AL,C[SI]
    ;ADD AL,[SI]
    INC SI
    LOOP LOOP1
   
    ADD AL,30H
    MOV D,AL
   
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
   
    MOV DX, OFFSET STR1
    MOV AH, 9h
    INT 21H
   
    MOV DX,0
    MOV DL,D
    MOV AH,2
    INT 21H
   
   
    MAIN ENDP
END MAIN