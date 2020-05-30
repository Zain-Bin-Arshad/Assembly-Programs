
ORG 100H

.CODE
MAIN PROC
    MOV AX,3
    XOR BX,BX
    
    PUSH AX
    CALL FACTORIAL

RET
MAIN ENDP

FACTORIAL PROC
    PUSH BP
    MOV BP,SP
    CMP [BP+4],1
    JG NO_BASE 
    MOV AX,1
    JMP RETURN
    
NO_BASE:    
    MOV BX,[BP+4]
    DEC BX
    PUSH BX
    CALL FACTORIAL 
    MUL [BP+4]
     
RETURN:
    POP BP
    RET 2   

FACTORIAL ENDP




