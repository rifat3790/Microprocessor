org 100h
.model small
.stack 100h

.data
    msg1 db 'Alphabet$'
    msg2 db 'Digit$'
    msg3 db 'others$'
    msg4 db 'Enter Input:$'
    newline db 0dh, 0ah, "$"

.code
main proc

    MOV AX, @DATA
    MOV DS, AX


    mov ah, 9
    lea dx, msg4
    int 21h

    ; Read character
    mov ah, 01h
    int 21h
    mov bl, al 

    ; Print newline
    mov ah, 9
    lea dx, newline
    int 21h

    ; Check character category
    cmp bl, 30h  ; Check if it's a digit
    JAE check_alpha

    others:
    mov ax, @data
    mov ds, ax
    mov ah, 9
    lea dx, msg3
    int 21h
    jmp end

    check_alpha:
    ; Compare with ASCII for digit '9'
    cmp bl, 39h  
    JBE print2
    
    ; Compare with ASCII for uppercase letter 'A'
    cmp bl, 41h  
    JAE check_lower

    print2:
    mov ax, @data
    mov ds, ax
    mov ah, 9
    lea dx, msg2
    int 21h
    jmp end

    check_lower:
    ; Compare with ASCII for uppercase letter 'Z'
    cmp bl, 5Ah  
    JBE print3

    small_letter:
    ; Compare with ASCII for lowercase letter 'a'
    cmp bl, 61h 
    JAE small_letter_1

    print3:
    mov ax, @data
    mov ds, ax
    mov ah, 9
    lea dx, msg1
    int 21h
    jmp end

    small_letter_1:
    ; Compare with ASCII for lowercase letter 'z'
    cmp bl, 7Ah  
    JBE print4

    print4:
    mov ax, @data
    mov ds, ax
    mov ah, 9
    lea dx, msg1
    int 21h

    end:
    ret

main endp
endp
