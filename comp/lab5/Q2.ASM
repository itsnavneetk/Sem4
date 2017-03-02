data segment
num dw 40h,90h,30h,150h
gcd dw 0
data ends
code segment
assume cs:code,ds:data
start:
      mov ax,data
      mov ds,ax

      mov dx,0
      mov ax,num
      mov bx,num+2
      lea di,gcd
      call gcdproc
      mov dx,0
      mov ax,num+4
      mov bx,num+6
      call gcdproc
      mov dx,0
      mov ax,gcd
      mov bx,gcd+2
      call gcdproc

      mov ah,4ch
      int 21h


      gcdproc proc
  back:cmp ax,bx
       je exit
       jc bigbx
    up:mov dx,0
       div bx
       cmp dx,0
       je exit
       mov ax,dx
       jmp back
 bigbx:xchg ax,bx
       jmp up
  exit:mov word ptr[di],bx
       inc di
       inc di
       ret
       gcdproc endp

       code ends
       end start
