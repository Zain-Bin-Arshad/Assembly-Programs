org 100h
.DATA
RESULT DW ?
OUTP DB 13, 10,"SUMMITION OF VALUE IN AX : ","$"

.CODE
    MOV AX, 10
    PUSH AX
    CALL SUMMITION
    MOV AH,9
    LEA DX,OUTP
    INT 21H
    
    MOV BX,RESULT
    XOR CX, CX    
    OR BX, BX 
    MOV AX, BX
    MOV BX, 10      
AGAIN:  
    XOR DX,DX       
    DIV BX 
    PUSH DX
    INC CX
    CMP AX,0
    JNE AGAIN
    MOV AH, 2     
PRINT:
    POP DX
    OR DL, 30H
    INT 21h
LOOP PRINT  
RET

RET

SUMMITION PROC
    PUSH BP
    MOV BP,SP
    MOV DX,[BP+4]
    CMP DL,0
    JE BASE
    
    ADD RESULT,DX
    DEC DX
    POP BX 
    PUSH DX
    CALL SUMMITION
    RET 2
BASE:
	POP BP
	RET 2
SUMMITION ENDP
