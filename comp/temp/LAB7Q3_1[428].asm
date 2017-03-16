data segment
A db 99h,10h,32h,69h,24h
n dw $-A ; no.of array elements
Data ends
code segment
        assume cs:code,ds:data
start:

mov ax,data
mov ds,ax

mov si,0 ;outer loop
mov dx,n
dec dx; dx=n-1

back2: 
	mov cx,dx ; cx=n-1
	sub cx,si ; cx=n-1-i
	mov di,0
back1: 
	mov al,a[di]
	cmp al,a[di+1]
	jc skip
	xchg al,a[di+1]
	mov a[di],al
skip:
	inc di
	loop back1
	inc si
	cmp si,dx
	jc back2


lea dx,a
mov ah,09h
int 21h

mov ah,4ch
int 21h

code ends
end start




