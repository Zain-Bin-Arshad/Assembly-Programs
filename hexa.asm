
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h



.data
next db 0dh,0ah,'$'

.code
xor bx,bx
XOR CL,CL   


mov cl,4
While:
mov ah,1
int 21h

    cmp al,0dh
    je EndWhile
    
    cmp al,39h
    jg letter
    
    and al,0fh
    jmp shift
    
letter:
    sub al,37h

shift:
    shl bx,4
    
    or bl,al
    
  
    loop While
    
EndWhile:
    mov  dx,offset next
    mov ah,9
    int 21h
    mov cx,4
    
    myloop:
    
        mov ah,2
        mov dl,bh
        shr dl,4
        
        cmp dl,10d
        jge Letter2
        
        add dl,30h
        int 21h
        jmp endofloop
        
        Letter2:
            add dl,37h
            int 21h
        
        endofloop:
            ROL bx,4
            loop myloop
ret




