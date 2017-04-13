data segment
a db 'Enter password - $'
b db 8 dup('$')
c db '*$'
d db '7654321'
va db 10,'Congratulations!$'
inv db 10,'Password Invalid$'
data ends
code segment
assume cs:code, ds:data
start:  mov ax,data
        mov ds,ax
        lea dx,a
        lea si,b
        mov ah,09
        int 21h
        mov cx,07
        back: mov ah,08
        int 21h
        mov [si],al
        inc si
        mov dx,offset c
        mov ah,09
        int 21h
        loop back       
        mov cx,07
        lea si,b
        lea di,d
        back2: mov ax,[si]
        mov bx,[di]
        inc si
        inc di
        cmp al,bl
        jne nequal
        loop back2
        lea dx,va
        mov ah,09
        int 21h
        jmp exit1
        nequal: lea dx,inv
        mov ah,09
        int 21h
        exit1:mov ah,4ch
        int 21h

code ends
end start


