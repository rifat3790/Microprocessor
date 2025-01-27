org 100h
.model small
.stack 100h

.data 
     

.code 
    main proc
        
    mov ah, 1 ;this is like printf function
    int 21h       ;bl input
    mov bl, al
    ;no need to write again and again same code.
    ;we can call mov ah, 1 using int 21h
    
    int 21h ;it call mov ah,1 then take input
    mov bh, al
    
    int 21h
    mov cl, al
    
    add bl, bh  ;bl = bl + bh
    sub bl, 48
    
    add bl, cl  ;bl = bl + cl
    sub bl, 48
           
           
    mov ah, 2
    mov dl, 0ah
    int 21h
    
    mov dl, 13
    int 21h
    
    mov ah, 2
    mov dl, bl
    int 21h
        
     exit:
     mov ah, 4ch
     int 21h
        
        main endp
    end main