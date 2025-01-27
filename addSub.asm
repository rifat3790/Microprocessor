org 100h
.model small
.stack 100h
.data

.code 
 
    main proc
        ;ah works as scan like c program to take the input from user
        ;input value will save into al register
        mov ah, 1 
        ; we use interrup 21h for stopping normal work 
       int 21h    
       mov bl, al ;store first input to bl register
       
       ; to print  we should always use mov ah, 2 
       mov ah, 2 
       mov dl, 0Ah
       int 21h
       
        ; cursor set into newline by using oah.but here is a problem. when i run odh to the dl.
       ;al value now will be odh. this is problem.
       ;so we need to store al value to another register  
       mov dl, 0dh
       int 21h
       
                 
       ; we use ah, 2 for show outpu. to show output we need dl register.
       mov ah, 2 
       ; since input value was into al register. so need to copy the vlaue of al to dl 
       mov dl, bl 
       int 21h
       
       main endp ; end process of main function, we can write other function below of it.
    end main