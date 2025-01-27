.model small
.stack 100h
.data
    sum     dw 0
    str     db "Summation of 1+3+5+...+99 is: $"

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Initialize registers
    mov cx, 1         ; Start with 1
    mov si, 99        ; End at 99
    mov dx, 0         ; Clear dx (for the final sum)

start_loop:
    add dx, cx        ; Add current value of cx to dx (sum)
    add cx, 2         ; Increase cx by 2 (next odd number)
    cmp cx, si        ; Check if cx exceeds 99
    jg end_loop       ; If greater, exit loop
    jmp start_loop    ; Otherwise, continue

end_loop:
    ; Output the result message
    mov dx, offset str
    mov ah, 9
    int 21h

    ; Convert sum in DX to ASCII and print it
    mov ax, dx
    call print_number

    ; Exit program
    mov ah, 4Ch
    int 21h

print_number proc
    ; Print the sum in AX (decimal conversion)
    mov bx, 10        ; Base 10 for decimal conversion
    mov cx, 0         ; Initialize digit count

convert_loop:
    xor dx, dx        ; Clear DX
    div bx            ; Divide AX by 10
    push dx           ; Push remainder onto stack (digit)
    inc cx            ; Count the digit
    test ax, ax       ; Check if AX is zero
    jnz convert_loop  ; If not, continue

print_digits:
    pop dx            ; Pop each digit from stack
    add dl, 30h       ; Convert to ASCII
    mov ah, 2         ; Print character
    int 21h
    loop print_digits ; Loop until all digits are printed
    ret
print_number endp
main endp
end main
