
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h
.data
ai db 50 dup(?)
counter dw 0 
error dw 0
enter db 13,10,"Please Enter characters !",13,10,"$"
reverse db 13,10,13,10,"Your Reserved Input Is : ","$"  
true db 13,10,13,10, "Your Input is PALINDROME","$"
false db 13,10,13,10, "Your Input is NOT a PALINDROME","$"

.code  
mov ax,@data
mov ds,ax

mov ah, 9
lea dx,enter 
int 21h
    
mov ah, 1
int 21h

mov bx,0     
input:
    
    cmp al,13
    je newLine
    
    mov ai[bx],al
    inc bx
    inc counter
    mov ah, 1
    int 21h 
    jmp input

newLine:
   mov ah, 9
   lea dx,reverse 
   int 21h 
   mov cx,counter 
   dec bx
   
output:   
    mov dl,ai[bx]
    dec bx
    mov ah, 2
    int 21h 
loop output


xor bx,bx
xor dx,dx
xor ax,ax
dec counter 
mov si, counter ;use si to point to last index
dec counter
mov cx,counter

palindrome:
    mov dl, ai[bx]
    mov al, ai[si] 
    cmp dl,al
    jne no
    inc bx
    dec si  
loop palindrome
 
    mov ah, 9
    lea dx,true 
    int 21h
    ret    

no:
    mov ah, 9
    lea dx,false 
    int 21h
    ret
    
    
    
    
          
    
        