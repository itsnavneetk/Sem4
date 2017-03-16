data segment
a db 3,4,2,7,1,5,6,9,0
n db $-a
pos dw ?
data ends

code segment
  assume cs:code, ds:data
 start:
   mov ax,data
   mov ds, ax

  ; mov dh,0
  ; mov di,0
  ; mov dl,a[0]
   call disp
   call selection_sort
   call disp
   mov ah,4ch
   int 21h

  selection_sort:
  mov bh,0
  mov bl,n
  dec bx
  dec bx
  
   mov di,0
 loop1:
   mov dh,0
   mov dl,a[di]
   mov pos,di

   mov ch,0
   mov cl,n
   dec cx
   mov si,di
   inc si
   sub cx,di
    loop2:
      cmp dl,a[si]
      jna cont
      mov dl,a[si]
      mov pos,si
     cont: inc si
   loop loop2

   mov si,pos
   mov ah,0
   mov al,a[di]
   mov a[si],al
   mov a[di],dl
   cmp di,bx
   jz exit
   inc di
   jmp loop1
   exit:
    ret


  disp:
   mov ch,0
   mov cl,n
   mov si,0
  back:
    mov dl,a[si]
    add dl,30h
    mov ah,02h
    int 21h
    inc si
   loop back
   mov dl,10h
   int 21h
   mov dl,13h
   int 21h
  ret
  code ends

end start
