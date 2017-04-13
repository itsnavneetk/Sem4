code segment
assume cs:code
start:
      mov bl,00h
 back:call display
      mov dl,13
      mov ah,02h
      int 21h
      call delay
      mov al,bl
      add al,01h
      daa
      mov bl,al
      mov dl,0ffh
      mov ah,06h
      int 21h
      jnz exit
      jmp back
 exit:mov ah,4ch
      int 21h

      display proc
      mov dl,bl
      mov cl,04h
      shr dl,cl
      add dl,30h
      mov ah,02h
      int 21h
      mov dl,bl
      and dl,0fh
      add dl,30h
       mov ah,02h
       int 21h
       ret
   display endp


   delay proc
      mov si,112h
  up1:mov di,12abh
   up:dec di
      jnz up
      dec si
      jnz up1
      ret
      delay endp

      code ends
      end start


