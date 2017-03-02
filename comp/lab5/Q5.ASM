data segment
num dw 0004h
fact dw ?
data ends

code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax

mov ax,num
call fact_proc
mov fact,ax

mov ah,4ch
int 21h

fact_proc:
push ax
dec ax
cmp ax,01h
jz exit
call fact_proc
pop bx
mul bx
jmp exit2
exit: pop ax
exit2: ret

code ends
end start
