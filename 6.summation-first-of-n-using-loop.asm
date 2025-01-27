.model small
.stack 100h
.data
    n      db ?
    sum    db ?
    str    dw "Enter number of elements: $"
    result dw "Sum of the digits: $"

.code
main proc
          mov  ax, @data
          mov  ds, ax


          mov  dx, offset str
          mov  ah, 9
          int  21h


          mov  ah, 1
          int  21h
          sub  al, 30h
          mov  n, al

          mov  cx, 0
          mov  cl, n
          mov  bl, 0
         

    start:
            mov al, cl
            mul al
            add  bl, al
          
          loop start

          mov  ax, 0
          mov  al, bl
          mov  bl, 10
          div  bl


          mov  bx, 0
          mov  bh, ah
          add  bh, 30h
          mov  bl, al
          add  bl, 30h

          mov  dl, bl
          mov  ah, 2
          int  21h

          mov  dl, bh
          mov  ah, 2
          int  21h

main endp
    end main