org 100h

.data
ARRAY DB 5 DUP (?)
TAKE DB 13,10,"PLEASE ! ENTER YOUR STRING : ","$"
DISP DB 13,10,"UPPERCASE STRING : ","$" 

.code
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,TAKE     ; PRINTING STRING TAKE
    INT 21H
     
    MOV CX,5        ; LOOP COUNTER 5
    MOV BX,0        ; BX USED TO POITN AT INDEX OF ARRAY
    
INPUT: 
    MOV AH,1        ; TAKE INPUT
    INT 21H
    SUB AL,32       ; CAHNGE TO UPPERCASE
    MOV ARRAY[BX],AL 
    INC BX          ; INDEX INCREMENTS
LOOP INPUT 

    MOV AH,9        ; PRINTING DISPLAY STRING
    LEA DX,DISP
    INT 21H
    MOV BX,0        ; POINT AT O INDEX
    MOV CX,5        ; LOOP COUNTER
    
DISPLAY:  
    MOV DL,ARRAY[BX]
    MOV AH,2
    INT 21H 
    INC BX  
LOOP DISPLAY

    
RET