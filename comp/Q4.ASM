data segment
n1 db 06h
n2 db 04h
n3 db 0Ah
n4 db 08h
lcm1 dw ?
lcm2 dw ?
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
mov dl,n1
call proc_lcm
mov lcm1,cx

mov ah,0h
mov al,n3
mov bl,n4
mov dl,n3
call proc_lcm
mov lcm2,cx

mov ah,0h
mov al,lcm2
mov bl,lcm1
mov dl,lcm2
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
add al,dl
adc ah,0
jmp abc
exit:
ret

code ends
end start
