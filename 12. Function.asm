.model small
.stack 100H
.DATA
a db 'Hello world $'
.CODE
main proc
    MOV AX, @DATA
    MOV DS, AX

    MOV DX, OFFSET a
    CALL PRINT
    
    main ENDP
PRINT PROC
    MOV AH, 9
    INT 21H

    MOV AH, 2
    MOV AH, 10
    INT 21H
    MOV AH, 13
    INT 21H
    RET
    PRINT ENDP
END MAIN