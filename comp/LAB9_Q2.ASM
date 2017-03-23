Data segment
 msg db 'Enter a string, press enter when done'
 nxtline db 10,13,'$'
 pent db 10 dup(?)
 P DB 'PALINDROME$'
 NP DB 'NOT A PALINDROME$'
Data ends

print macro msg
 LEA DX, msg
 MOV AH, 09
 INT 21H
ENDM

Code segment
 assume cs:code, ds:data

Start:

 MOV AX, data
 MOV DS, AX; init DSR
 MOV ES, AX; INIT ESR

 CLD; DF=0

 ;to read
 MOV SI, 0

 PRINT msg

 LEA DI, pent

 read:
 MOV AH, 01
 INT 21H; 
 STOSB; al has char entered
 
 CMP AL, 0DH
 JNZ read

 DEC DI

 LEA SI, pent
 DEC DI

 compare:
  CMPSB
  JNZ NPAL
  DEC DI
  DEC DI
  CMP DI, SI
  JBE PAL
  JMP COMPARE

  NPAL:
   PRINT NP
   JMP DONE
  PAL:
   PRINT P

  DONE:
 MOV AH, 4CH
 INT 21H

 Code ends
End Start
