code segment
assume cs:code
start:
      mov bl,00h
 back:call display
      mov dl,13
      mov ah,02h
      int 21h
      call delay
      inc bl
      
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
      cmp dl,0ah
      jc down
      add dl,07h
 down:add dl,30h
      mov ah,02h
      int 21h
      mov dl,bl
      and dl,0fh
      cmp dl,0ah
      jc down1
      add dl,07h
 down1:add dl,30h
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


