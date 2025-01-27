org 100h
.model small
.stack 100h

.code 
    main proc
        
     mov ah, 1
     int 21h    ;take first input
     mov bl, al
     
     mov ah, 1
     int 21h    ;take second input
     mov bh, al
     
     add bl, bh ;bl = bl + bh
     sub bl, 48
    
     
     mov ah, 2
     mov dl, bl
     int 21h
        
     exit:
     mov ah, 4ch
     int 21h
        
        main endp
    end main