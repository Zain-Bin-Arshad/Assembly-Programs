
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
even db 13,10,"   even","$" 
oddp db 13,10,"   odd","$"
counter db 0

.code

mov ax,@data
mov ds,ax
  
mov ah,1
int 21h 
xor bx,bx
xor cx,cx

BIN:
    cmp al,13
    je space 
    and al,0fh 
    shl bx,1
    or bl,al
    inc cx
    int 21h
    jmp BIN
    
space:     
    mov ah,2
    mov dl,13
    int 21h 

    mov dl,10
    int 21h
    xor cx,cx
    
BOUT:
     cmp cx,8
     je parity1
     inc cx
     rol bl,1
     jnc out0
     
     mov ah,2
     mov dl,'1'
     int 21h
     jmp BOUT
     
out0:
mov ah,2
    mov dl,'0'
    int 21h 
    
    jmp BOUT


parity1:
xor cx,cx
    
parity: 
     cmp cx,8
     je print1
     inc cx
     rol bl,1  
     jnc odd
     inc counter 
odd:
 jmp parity     
     

print1:

cmp counter,0  
je print
cmp counter,2  
je print
cmp counter,4
je print
cmp counter,6
je print
cmp counter,8 
je print

mov ah,9
lea dx,oddp
int 21h 
ret

 print:
  mov ah,9
lea dx,even
int 21h 
ret

 





