.model small
.stack 100h
.data
    char1 db ?
    char2 db ?
.code
main proc
         mov ax, @data
         mov ds, ax

         mov ah, 1
         int 21h
         mov char1, al

         mov ah, 2
         mov dl, 10
         int 21h
         mov dl, 13
         int 21h

         mov ah, 1
         int 21h
         mov char2, al

         mov ah, 2
         mov dl, 10
         int 21h
         mov dl, 13
         int 21h

         mov ah, 2
         mov dl, char2
         int 21h

         mov ah, 2
         mov dl, 10
         int 21h
         mov dl, 13
         int 21h

         mov ah, 2
         mov dl, char1
         int 21h

        
    exit:
         mov ah, 4Ch
         int 21h
main endp
end main
