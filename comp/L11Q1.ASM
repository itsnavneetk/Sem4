code segment
assume cs:code
start:
mov ah,0
mov al,03
int 10h
back:
		mov dl,0ffh
		mov ah,06h
		int 21h
		jnz exit
		jz back2
		exit: mov ah,4CH
		int 21h
back2:

		mov ah,06
		mov al,0
		mov bh,01000000b
		mov ch,00
		mov cl,00
		mov dh,25
		mov dl,80
		int 10h
		mov ah,06
		mov al,0
		mov bh,00100000b
		mov ch,05
		mov cl,10
		mov dh,20
		mov dl,70
		int 10h
		mov ah,06
		mov al,0
		mov bh,00010000b
		mov ch,10
		mov cl,20
		mov dh,15
		mov dl,60
		int 10h
		call delay


		mov ah,06
		mov al,0
		mov bh,00100000b
		mov ch,00
		mov cl,00
		mov dh,25
		mov dl,80
		int 10h	
		mov ah,06
		mov al,0
		mov bh,00010000b
		mov ch,05
		mov cl,10
		mov dh,20
		mov dl,70
		int 10h
		mov ah,06
		mov al,0
		mov bh,01000000b
		mov ch,10
		mov cl,20
		mov dh,15
		mov dl,60
		int 10h
		call delay


		mov ah,06
		mov al,0
		mov bh,00010000b
		mov ch,00
		mov cl,00
		mov dh,25
		mov dl,80	
		int 10h
		mov ah,06
		mov al,0
		mov bh,01000000b
		mov ch,05
		mov cl,10
		mov dh,20
		mov dl,70
		int 10h
		mov ah,06
		mov al,0
		mov bh,00100000b
		mov ch,10
		mov cl,20
		mov dh,15
		mov dl,60
		int 10h
		call delay

		jmp back

		delay proc
		mov si,0ff0h
up1: 		
		mov di,00f0h
up2:
		dec di
jnz up2
dec si
jnz up1
ret 
delay endp

mov ah,4ch
int 21h
code ends
end start

