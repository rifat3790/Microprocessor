.model small
.stack 100h
.data
    msg_positive db 'The number is positive.$'
    msg_negative db 'The number is negative.$'
    msg_zero     db 'The number is zero.$'
    newline      db 0Dh, 0Ah, '$'
.code
main proc
                   mov ax, @data
                   mov ds, ax

                   mov ah, 1
                   int 21h
                   cmp al, '0'
                   je  print_zero

                   cmp al, '9'
                   jg  invalid_input

                   cmp al, '-'
                   je  input_negative

                   sub al, '0'
                   jmp print_positive

    input_negative:
                   mov ah, 1
                   int 21h
                   sub al, '0'
                   jmp print_negative

    print_positive:
                   mov ah, 9
                   lea dx, msg_positive
                   int 21h
                   jmp newline_proc

    print_negative:
                   mov ah, 9
                   lea dx, msg_negative
                   int 21h
                   jmp newline_proc

    print_zero:    
                   mov ah, 9
                   lea dx, msg_zero
                   int 21h
                   jmp newline_proc

    invalid_input: 
                   jmp newline_proc

    newline_proc:  
                   mov ah, 9
                   lea dx, newline
                   int 21h

                   mov ah, 4Ch
                   int 21h
main endp
end main
