;string, es ee


print macro str
        lea dx, str
        mov ah, 09
        int 21h
endm 
data segment
        msg1 db "enter str $"
        msg2 db 10, 13, '$'
        len1 db 10
        len2 db ?
        str db 10 dup(?)

data ends
code segment
assume cs:code, ds:data, es:data
start:
        mov ax, data
        mov ds, ax
        mov es, ax

        print msg1
        print msg2
        lea dx, str
        mov ah, 0ah
        int 21h

        print str
        
         mov ah, 4ch
         int 21h
code ends
end start
