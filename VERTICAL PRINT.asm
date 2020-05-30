

ORG 100H

.DATA
    ARRAY DB 20 DUP(?)    
    
.CODE
MAIN PROC
    LEA DI,ARRAY
    MOV AH,1
    INT 21H
INPUT:
    CMP AL,0DH
    JE SHORO    
    MOV [DI],AL
    INC DI                     
    MOV AH,1            ; TAKE INPUT AND STORE IN ARRAY
    INT 21H   
    JMP INPUT
    
SHORO:
    MOV AH,6
    MOV AL,0   ;CLEAR SCREEN
    XOR CX,CX
    MOV DX,184FH
    INT 10H
    LEA SI,ARRAY
    LODSB 
    XOR DX,DX
    MOV DL,10
    
PRINT_WHILE:
    CMP AL,0
    JE BLINK    
    INC DH
    MOV AH,2
    MOV BH,0
    INT 10H                 ;PRINTS ARRAY VERTICALLY
    MOV AH,9
    MOV BL,01110000B
    MOV CX,1
    INT 10H
    LODSB
    JMP PRINT_WHILE    
    
BLINK:
    ;JMP SHORO
       
RET    
MAIN ENDP



