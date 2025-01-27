.model small
.stack 100h
.data
    n      db ?
    sum    dw ?
    str    db "Enter number of elements: $"
    result db "Sum of the digits: $"

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

          mov  al, n
          cbw

          inc  ax
          mov  bx, ax
          mov  al, n
          cbw
          mul  bx
          mov  bx, 2
          div  bx
          mov  sum, ax

          mov  dx, offset result
          mov  ah, 9
          int  21h

          mov  ax, sum
          call print_num

          mov  ah, 4ch
          int  21h

main endp

print_num proc
          mov  bx, 10
          xor  cx, cx
    next_digit:
          xor  dx, dx
          div  bx
          push dx
          inc  cx
          test ax, ax
          jnz  next_digit

    print_loop:
          pop  dx
          add  dl, 30h
          mov  ah, 2
          int  21h
          loop print_loop
          ret
print_num endp
end main
