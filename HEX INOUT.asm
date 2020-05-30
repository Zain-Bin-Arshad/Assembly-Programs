
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
take db 10,13,"INPUT YOUR HEX NUMBER : ","$"
give db 10,13,"YOUR HEX OUTPUT IS : ","$"
.code 
mov ax,@data
mov ds,ax

mov ah,9
lea dx,take
int 21h

xor bx,bx
mov ah,1
int 21h

hexIN:
    cmp al,13
    je hex
    cmp al,39h
    ja letter
    and al,0fh
    jmp shift
    
letter:
    sub al,37h
    
shift:
    mov cl,4
    shl bx,cl
    or bl,al
    int 21h
    jmp hexIN

hex:
    mov ah,9
    lea dx,give
    int 21h

hexOUT:
    mov dl,bh
    shr dl,4
    cmp dl,10
    jb digit
    add dl,37h
    jmp shiftO 
digit:
    add dl,30h

shiftO:        
    mov ah,2
    int 21h
    rol bx,4
loop hexOUT    
           
exit:
    ret




