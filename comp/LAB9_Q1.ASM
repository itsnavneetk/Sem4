data segment
msg1 db 'Enter a 6 lettered password'
nextl db 10,13,'$'
act_pass db 'ritwij'
len dw $-act_pass
ent_pass db 7 dup(?)
msg2 db 'Password Rejected$'
msg3 db 'Password Accepted$'
data ends

        print macro msg
        lea dx, msg
        mov ah,09h
        int 21h
        endm


code segment
  assume cs:code, ds:data
   start:
    mov ax, data
    mov ds,ax
    mov es,ax
    cld

    print msg1
    lea si,act_pass
    lea di,ent_pass

    mov cx,len
  loop1:
    mov ah,08
    int 21h
    stosb;
    mov dl,'*'
    mov ah,02h
    int 21h
   loop loop1

    lea di,ent_pass
    mov cx,len
    repz cmpsb
    jne not_equal
    print nextl
    print msg3
    print nextl
    jmp exit
  not_equal:
    print nextl
    print msg2
    print nextl
  exit:
    mov ah,4ch
    int 21h

    code ends
 end start
