;palindrome, string, ES

print macro msg
        lea dx, msg
        mov ah, 09h
        int 21h
endm
data segment
        msg1 db 'enter a string $'
        newl db 10, 13, '$'
        str1 db 10 dup('0')                
        str2 db 10 dup('0')
        len1 db 0
        len2 db 0
data ends
code segment
assume cs:code, ds:data, es:data
start:
        mov ax, data
        mov ds, ax
        mov es, ax
        print msg1
        print newl
        lea si, str1
more:
        mov ah, 02
        int 21h
        mov [si], al
        inc si
        inc len1
        cmp al, 10
        je finish
        jmp more
finish:
        lea si, str1
        lea dx, str1
        mov ah, 09
        int 21h

        mov ah, 4ch
        int 21h
code ends
end start
