.model small
.stack 100h

.data
    a db ?
    b db ?
    result db ?
    remainder db ?
    newline db 10, 13, "$"
    prompt1 db 'Enter first number: $'
    prompt2 db 'Enter second number: $'
    add_result db 'Addition Result: $'
    sub_result db 'Subtraction Result: $'
    mul_result db 'Multiplication Result: $'
    div_quotient db 'Division Quotient: $'
    div_remainder db 'Division Remainder: $'

.code
main proc
    ; Setup data segment
    mov ax, @data
    mov ds, ax

    ; Print "Enter first number: "
    lea dx, prompt1
    mov ah, 9
    int 21h

    ; Read first number
    mov ah, 1
    int 21h
    sub al, 48
    mov a, al

    ; New line
    lea dx, newline
    mov ah, 9
    int 21h

    ; Print "Enter second number: "
    lea dx, prompt2
    mov ah, 9
    int 21h

    ; Read second number
    mov ah, 1
    int 21h
    sub al, 48
    mov b, al

    ; New line
    lea dx, newline
    mov ah, 9
    int 21h

    ; Addition
    mov al, a
    add al, b
    mov result, al

    ; Print "Addition Result: "
    lea dx, add_result
    mov ah, 9
    int 21h

    ; Print result
    mov ah, 2
    mov dl, result
    add dl, 48
    int 21h

    ; New line
    lea dx, newline
    mov ah, 9
    int 21h

    ; Subtraction
    mov al, a
    sub al, b
    mov result, al

    ; Print "Subtraction Result: "
    lea dx, sub_result
    mov ah, 9
    int 21h

    ; Print result
    mov ah, 2
    mov dl, result
    add dl, 48
    int 21h

    ; New line
    lea dx, newline
    mov ah, 9
    int 21h

    ; Multiplication
    mov al, a
    mul b
    mov result, al

    ; Print "Multiplication Result: "
    lea dx, mul_result
    mov ah, 9
    int 21h

    ; Print result
    mov ah, 2
    mov dl, result
    add dl, 48
    int 21h

    ; New line
    lea dx, newline
    mov ah, 9
    int 21h

    ; Division
    mov al, a
    mov ah, 0
    div b
    mov result, al
    mov remainder, ah

    ; Print "Division Quotient: "
    lea dx, div_quotient
    mov ah, 9
    int 21h

    ; Print quotient
    mov ah, 2
    mov dl, result
    add dl, 48
    int 21h

    ; New line
    lea dx, newline
    mov ah, 9
    int 21h

    ; Print "Division Remainder: "
    lea dx, div_remainder
    mov ah, 9
    int 21h

    ; Print remainder
    mov ah, 2
    mov dl, remainder
    add dl, 48
    int 21h

    ; New line
    lea dx, newline
    mov ah, 9
    int 21h

main endp
end main
