org 100h

.CODE  

MAIN PROC       		
    MOV AX, 10
    MOV DX, 0
    MOV CX, 0
    CALL FIB 
RET 

MAIN ENDP

FIB PROC            
    PUSH AX
    CMP AX,1
    JLE RET1
    DEC AX
    
CALL FIB
    PUSH CX
    MOV CX, DX
    DEC AX
    CALL FIB
     
    ADD DX, CX
    POP CX
    POP AX 
    RET 
    
RET1:          
    MOV DX, 1
    POP AX
    RET
    
FIB ENDP
