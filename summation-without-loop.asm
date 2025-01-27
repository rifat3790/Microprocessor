.model small
.stack 100h
.data
    sum dw 0           ; Variable to store the summation result
    n   dw 50          ; The value of n (50 odd numbers)
.code
main proc
    mov ax, @data
    mov ds, ax         ; Initialize data segment

    mov ax, n          ; Load n (50) into AX
    mul ax             ; Multiply AX by itself (AX = AX * AX)
    mov sum, ax        ; Store the result in sum

    ; Output the sum (as a decimal number)
    call print_result  ; Call subroutine to print the result

    ; Exit the program
    mov ah, 4Ch
    int 21h
main endp

; Subroutine to print the result in AX
print_result proc
    push ax            ; Save AX
    push bx
    push cx
    push dx

    mov cx, 0          ; Clear CX (to count digits)
    
    ; Convert AX (sum) to decimal and store the digits
    print_loop:
        xor dx, dx     ; Clear DX
        mov bx, 10     ; Divide by 10 to extract digits
        div bx         ; AX / 10, quotient in AX, remainder in DX
        push dx        ; Push remainder (digit) to stack
        inc cx         ; Count number of digits
        cmp ax, 0
        jne print_loop ; Repeat until AX is 0

    ; Now print the digits
    print_digits:
        pop dx         ; Get the digit from the stack
        add dl, 30h    ; Convert it to ASCII
        mov ah, 2      ; DOS interrupt to print character
        int 21h
        loop print_digits

    ; Restore registers
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_result endp
end main
