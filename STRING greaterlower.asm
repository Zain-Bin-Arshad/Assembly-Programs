
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
array db 15 dup(?) 
COUNTER DB 0  
TAKE DB 13,10,"PLEASE ! ENTER YOUR STRING : ","$"
GREAT DB 13,10,13,10,"GREATER IS : ","$"
LOW  DB 13,10,13,10, "LOWER   IS : ","$"  

.code
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    MOV AH,9
    LEA DX,TAKE
    INT 21H
    
    CLD
    LEA DI,ARRAY
    MOV AH,1
    INT 21H 
     
INPUT:
    CMP AL,13
    JE FINDG
    STOSB
    INC COUNTER
    MOV AH,1
    INT 21H
    JMP INPUT
FINDG:
    XOR CX,CX 
    MOV BL,ARRAY[0]
    MOV SI,1 
    
GREATER:
    CMP CL,COUNTER
    JE FINDL   
    CMP BL,ARRAY[SI]
    JB MOVEG
    INC SI 
    INC CL
    JMP GREATER
    
MOVEG:
     MOV BL,ARRAY[SI]
     INC SI
     INC CL
     JMP GREATER           

FINDL: 
    DEC COUNTER
    PUSH BX
    XOR CX,CX 
    MOV BL,ARRAY[0]
    MOV SI,0 
    
LOWER:
    CMP CL,COUNTER
    JE PRINT   
    CMP BL,ARRAY[SI]
    JA MOVEL
    INC SI 
    INC CL
    JMP lOWER
    
MOVEL:
    MOV BL,ARRAY[SI]
    INC SI
    INC CL
    JMP LOWER
           
PRINT:
    MOV AH,9
    MOV DX,OFFSET LOW  
    INT 21H
    MOV AH,2
    MOV DL,BL
    INT 21H
     
    POP BX
  
    MOV AH,9
    MOV DX,OFFSET GREAT  
    INT 21H 
    MOV AH,2
    MOV DL,BL
    INT 21H  

ret




