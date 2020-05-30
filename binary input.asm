
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
take db 10,13,"INPUT YOUR BINARY NUMBER : ","$"
give db 10,13,"YOUR BINARY OUTPUT IS : ","$"
.code 
mov ax,@data
mov ds,ax

mov ah,9
lea dx,take
int 21h

xor bx,bx
mov ah,1
int 21h


BinaryIN:
    cmp al,13
    je show
    and al,0fh
    shl bx,1
    or bl,al
    int 21h
    jmp BinaryIN

show:
  mov ah,9
  lea dx,give
  int 21h
  mov cx,0
    
BinaryOUT:
    cmp cx,8
    je exit
    inc cx 
    rol bl,1
    jnc OUT1
    
    mov ah,2
    mov dl,'1'
    int 21h
    jmp BinaryOUT
    
OUT1:
    mov ah,2
    mov dl,'0'
    int 21h
    jmp BinaryOUT

exit:
ret