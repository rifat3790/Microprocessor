;lowercase letter to uppercase letter
org 100h
.model small
.stack 100h

.data 
     

.code 
    main proc
        
     mov ah, 1
     int 21h
     mov bl, al
     
     sub bl, 32
     
     mov ah, 2
     mov dl, bl
     int 21h
    
        
     exit:
     mov ah, 4ch
     int 21h
        
        main endp
    end main