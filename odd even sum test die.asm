.MODEL SMALL
.STACK 100H

.DATA
    msg1 db 'Even number summation is: $'
    msg2 db 'Odd number summation is: $'
    arr db 10 dup(?)             ; Number of terms (change as needed)
    sumEven db 0        ; Variable to store the sum of even numbers
    sumOdd db 0         ; Variable to store the sum of odd numbers
    newline db 10, 13, "$"

.CODE
    MOV AX, @DATA       ; Initialize data segment
    MOV DS, AX
    
    mov si, offset arr
    ;take array size from user
    mov ah, 1
    int 21h
    sub al, 48
    mov cx, 0
    mov bl, al
    mov cl, bl
 
    
    ;print newline
    mov ah, 9
    lea dx, newline
    int 21h
    
    ;take array input from user 
    input:
    mov ah, 1
    int 21h
    mov [si], al
    inc si
    loop input
    
     
     ;print newline
    mov ah, 9
    lea dx, newline
    int 21h
    mov cl, bl
    mov si, offset arr

    MOV sumEven, 0      ; Initialize sumEven to 0
    MOV sumOdd, 0       ; Initialize sumOdd to 0

    LOOP_START:
        mov bh, [si]
        TEST bh, 1      ; Check the least significant bit of BL (odd or even)
        JZ IS_EVEN      ; Jump to IS_EVEN if the number is even

    IS_ODD:
        sub bh, 48
        ADD sumOdd, bh  ; Add the number to sumOdd
        JMP CONTINUE

    IS_EVEN:
        sub bh, 48
        ADD sumEven, bh ; Add the number to sumEven

    CONTINUE:
        INC si          ; Increment BX to get the next number
        LOOP LOOP_START ; Loop until CX becomes zero
    
    mov ah, 9
    lea dx, msg2
    int 21h
    ;print odd sum
    mov ah, 2
    add sumOdd, 48
    mov dl, sumOdd
    int 21h  
    
    mov ah, 9
    lea dx, newline
    int 21h
    
    mov ah, 9
    lea dx, msg1
    int 21h
    ;print even sum
    mov ah, 2
    add sumEven, 48
    mov dl, sumEven
    int 21h
    

END