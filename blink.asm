
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.DATA
    COUNTER DB 0
.CODE
MAIN PROC
   xor ax,ax
   mov es,ax
   mov es:[8*4],print
   mov es:[8*4+2],cs

pichkari:   
   int 8h 
   jmp pichkari 
      
    
PRINT:  
    push es
    MOV AL, '*' ; character to display.
    MOV BH, 0; = page number.
    MOV BL, 00000111B ;= attribute.
    MOV CX,1 ;= number of times to write character.
    MOV AH, 9
    INT 10H
    
    MOV AH,6
    mov AL,0
    XOR CX,CX 
    MOV DX,184FH
    INT 10H 
    inc counter
     
    xor dx,dx
    mov dl,counter
    mov ah,2
    int 10h
    pop es
   iret  
     
MAIN ENDP
END MAIN




