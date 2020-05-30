
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
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
    MOV BH,0B0H
    MOV DX,0C4FH
    INT 10H
    
    
    
    MOV AH,6       
    MOV AL,0   ;CLEAR SCREEN
    MOV CX,0D00H
    MOV BH,0C0H
    MOV DX,184FH
    INT 10H 
    
    MOV AH,6       
    MOV AL,0   ;CLEAR SCREEN
    MOV CX,0027H
    MOV BH,0D0H
    MOV DX,0C4FH
    INT 10H 
    
    MOV AH,6       
    MOV AL,0   ;CLEAR SCREEN
    MOV CX,0D27H
    MOV BH,0E0H
    MOV DX,184FH
    INT 10H 
    
     MOV AH,6
    MOV AL,0   ;CLEAR SCREEN
    XOR CX,CX
    MOV BH,0B0H
    MOV DX,0C4FH
    INT 10H
    
    
    
    MOV AH,6       
    MOV AL,0   ;CLEAR SCREEN
    MOV CX,0D00H
    MOV BH,0C0H
    MOV DX,184FH
    INT 10H 
    
    MOV AH,6       
    MOV AL,0   ;CLEAR SCREEN
    MOV CX,0027H
    MOV BH,0D0H
    MOV DX,0C4FH
    INT 10H 
    
    MOV AH,6       
    MOV AL,0   ;CLEAR SCREEN
    MOV CX,0D27H
    MOV BH,0E0H
    MOV DX,184FH
    INT 10H
     MOV AH,6
    MOV AL,0   ;CLEAR SCREEN
    XOR CX,CX
    MOV BH,0B0H
    MOV DX,0C4FH
    INT 10H
    
    
    
    MOV AH,6       
    MOV AL,0   ;CLEAR SCREEN
    MOV CX,0D00H
    MOV BH,0C0H
    MOV DX,184FH
    INT 10H     
    
    MOV AH,6       
    MOV AL,0   ;CLEAR SCREEN
    MOV CX,0000H
    MOV BH,0D0H
    MOV DX,0C27H
    INT 10H 
    
    MOV AH,6       
    MOV AL,0   ;CLEAR SCREEN
    MOV CX,0D27H
    MOV BH,0A0H
    MOV DX,1827H
    INT 10H
    
    
    MOV AH,6       
    MOV AL,0   ;CLEAR SCREEN
    MOV CX,0027H
    MOV BH,0D0H
    MOV DX,0C4FH
    INT 10H 
    
    MOV AH,6       
    MOV AL,0   ;CLEAR SCREEN
    MOV CX,0D27H
    MOV BH,0E0H
    MOV DX,184FH
    INT 10H
            
     MOV AH,6       
    MOV AL,0   ;CLEAR SCREEN
    MOV CX,0000H
    MOV BH,0D0H
    MOV DX,0C27H
    INT 10H  
    MOV AH,6
    MOV AL,0   ;CLEAR SCREEN
    XOR CX,CX
    MOV BH,0B0H
    MOV DX,0C4FH
    INT 10H  
    
    MOV AH,6       
    MOV AL,0   ;CLEAR SCREEN
    MOV CX,0027H
    MOV BH,50H
    MOV DX,0C4FH
    INT 10H   
            
ret
MAIN ENDP



