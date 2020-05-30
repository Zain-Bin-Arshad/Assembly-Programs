
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.CODE   
MAIN PROC
    
    MOV AX,0B800H
    MOV DS,AX
    MOV CX,2
    MOV DI,0
    
DISPLAY:
        MOV [DI],9D5AH
        ADD DI,2
LOOP DISPLAY
ret
MAIN ENDP



