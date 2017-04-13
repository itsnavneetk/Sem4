print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
data segment
m1 db "enter lower limit$"
m2 db "enter upper limit$"
m3 db 10,13,"$"
n1 db 0
n2 db 0
data ends

code segment
assume cs:code,ds:data
start:
      mov ax,data
      mov ds,ax
      print m1
      call rdlim
      mov n1,dh
      print m2
      call rdlim
      mov n2,dh
      print m3
 back1:mov bl,n1
 back:call display
      mov dl,13
      mov ah,02h
      int 21h
      call delay
      inc bl
      cmp bl,n2
      jnc back1
      
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

   rdlim proc
      mov ah,01h
      int 21h
      sub al,30h
      cmp al,0ah
      
      mov dh,al
      mov cl,04h
      shl dl,cl
      mov ah,01h
      int 21h
      sub al,30h
      add dh,al
      ret
   rdlim endp
      code ends
      end start


