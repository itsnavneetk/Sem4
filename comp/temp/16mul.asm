data segment 
	n1 dw 7895H
	n2 dw 0FFFFH
	product dw 2 dub(?)
data ends 
code segment 
assume cs:code, ds:data
start:
	mov ax, data
	mov ds, ax

	mov dx, 0
	mov ax, n1	; ax = 7895
	mul n2		; 7895 * ffff -> dx:ax  50%(MS) in dx rest in ax
	mov product, ax
	mov product[2], dx

	mov ah, 4ch 
	int 21H
code ends
end start
