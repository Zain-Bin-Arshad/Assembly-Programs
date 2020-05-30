
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.code
MAIN PROC
           
    MOV AH,1
    MOV CH,0
    MOV CL,13
    INT 10H        

    RET
MAIN ENDP    
END MAIN  



