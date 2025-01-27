.model small
.stack 100h
.data
    n      db ?
    fact   dw ?
    str    db "Enter a number: $"
    result db "Factorial: $"

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

          mov  ax, 1
          mov  cl, n

    factorial_loop:
          cmp  cl, 0
          je   end_factorial
          mul  cl
          dec  cl
          jmp  factorial_loop

    end_factorial:
          mov  fact, ax

          mov  dx, offset result
          mov  ah, 9
          int  21h

          mov  ax, fact
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
