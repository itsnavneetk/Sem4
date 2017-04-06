 data segment
a db 00h
nxt db 13,'$'
data ends

print macro m
lea dx,m
mov ah,09h
int 21h
endm

code segment
        assume cs:code,ds:data
start:
mov ax,data
mov ds,ax



countup:
        call disp
        call delay
        
        inc a

        mov dl,0ffh
        mov ah,06h
        int 21h
        jnz exit

        print nxt

        cmp a,0ffh
        jbe countup

exit:
mov ah,4ch
int 21h

disp:

mov al,a
mov ah,00h
mov bl,10h
div bl; ah=05h , al=02h
xchg al,ah; ah=02h , al=05h
add ax,3030h ; ah =32h , al=35h
mov bl,al; bl=35h
cmp ah,39h
jbe dec1
add ah,07h
dec1:
mov dh,0h
mov dl,ah  ; dl =32h (ascii 2)
MOV AH,02H
INT 21H

mov al,bl ; al=35h
cmp al,39h

jbe dec2
add al,07h

dec2:
mov dh,0h
mov dl,al ; dl=35h

mov ah,02h
int 21h

ret

delay:
mov cx,0f00h
back:mov di,00f0h
back1:dec di
jnz back1
loop back
ret

code ends
end start
