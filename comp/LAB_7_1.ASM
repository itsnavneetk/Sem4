data segment
        array db 10H, 20H, 30H, 40H, 50H
        n db 50H
        m1 db "found $"
        m2 db "not found $"
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, DATA
        MOV DS, AX
        MOV SI, -1    
        MOV AL, n 
        MOV CX, 05

BACK:
        INC SI
        CMP AL, [SI]
        LOOPNZ BACK
        JZ DOWN
        LEA DX, m2
        JMP EXIT
DOWN:
        LEA DX, m1
EXIT:
        MOV AH, 09
        INT 21H
        MOV AH, 4CH
        INT 21H
CODE ENDS
END START 


