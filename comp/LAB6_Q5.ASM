data segment
n1 db 05h
res dw ?
data ends

code segment
        assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax

        mov al,n1
        mov ah,0
        call fact

fact:   push ax
        dec ax
        cmp ax,1
        jz exit
        call fact
        pop bx
        mul bx
        jmp exit2
  exit: pop ax
 exit2: ret
code ends
end start

