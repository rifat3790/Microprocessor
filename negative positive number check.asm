; check a number is negative or positive

org 100h
.model small
.stack 100h
.data
    a db 'Non-negative $'
    b db 'Negative $'
    

.code
    main proc
        
        mov ax, @data
        mov ds, ax
        
        mov bx, -9
        
        cmp bx, 0
        jge L1
        jmp l2
        
        L1:
        mov ah, 9
        lea dx, a
        int 21h
        jmp exit ;unconditional jump
        
        
        L2:
        mov ah, 9
        lea dx, b
        int 21h
        jmp exit
        
        
        
        
        exit:
        mov ah, 4ch
        int 21h
        
        
        main endp
    end main
    