data segment
        array dW 1010H, 0052H, 2313H, 0039H, 1066H
        small dW ?
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, DATA
        MOV DS, AX
        MOV CX, 05H

        LEA SI, array
        MOV AX, [SI]
        DEC CX
UP:
        CMP AX, [SI+2]
        JB CONTD  ;if ax smaller than next 
        MOV AX, [SI+2]
CONTD:
        ADD SI, 2
        DEC CX
        JNZ UP
        MOV small, AX
        MOV AH, 4CH
        INT 21H
CODE ENDS
END START 

