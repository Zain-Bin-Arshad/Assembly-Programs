ORG 100H

.DATA
ARRAY DB 1,2,4,5 
SIZE DW 4
RESULT DB 13,10,"PRODUCT OF ARRAY VALUE IS : ","$"
.CODE

    MOV CX,1
    MOV AX,SIZE
    PUSH OFFSET ARRAY
    PUSH AX
    PUSH CX
     
    CALL FUNCTION   
    PUSH AX
    MOV AH,9
    LEA DX, RESULT
    INT 21H
    POP BX
    
    XOR CX,CX    
    OR BX,BX 
    MOV AX,BX
    MOV BX,10
          
AGAIN:  
    XOR DX,DX       
    DIV BX 
    PUSH DX
    INC CX
    CMP AX,0
    JNE AGAIN
    MOV AH,2
     
PRINT:
    POP DX
    OR DL,30H
    INT 21h
LOOP PRINT  
     
     
RET

FUNCTION PROC
    POP BP
    POP CX
    POP AX
    POP SI
    
    CMP AX,CX
    JNG RETURN
    
    
    PUSH BP 
    PUSH SI
    INC CX
    PUSH AX
    PUSH CX
    CALL FUNCTION
    
    DEC CX
    ADD SI,CX
    MUL [SI]
    SUB SI,CX
RET

RETURN:
    DEC CX
    ADD SI,CX
    MOV AL,[SI]
    SUB SI,CX
    PUSH BP
    RET
FUNCTION ENDP         