data segment
n1 db 06h
n2 db 04h
lcm dw ?
data ends

code segment
assume cs:code,ds:data
start:
mov dx,data
mov ds,dx

mov ah,0h
mov al,n1
mov bl,n2

call proc_lcm
mov lcm,cx

mov ah,4ch
int 21h

proc_lcm:
abc:
mov cx,ax
div bl
cmp ah,0
je exit
mov ax,cx
add al,n1
adc ah,0
jmp abc
exit:
ret

code ends
end start
