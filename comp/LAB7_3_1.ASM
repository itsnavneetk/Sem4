;BUBBLE 
data segment
        array db 45H, 23H, 89H, 03H, 24H

data ends
code segment
assume cs:code, ds: data
start:
        MOV AX, DATA
        MOV DS, AX
        MOV CX, 04
BACK:
        MOV BX, 0
UP:
        MOV AL, array[BX]
        CMP AL, array[BX+1]
        JC DOWN
        XCHG AL, array[BX+1]
        MOV array[BX], AL 
DOWN:
        INC BX
        CMP BX, CX
        JNC DOWN1
        JMP UP
DOWN1:
        LOOP BACK 

        MOV AH, 4CH
        INT 21H
code ends
end start 
