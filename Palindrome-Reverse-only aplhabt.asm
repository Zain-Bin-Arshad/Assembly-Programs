
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h
.data
ai db 50 dup(?)
counter dw 0 
enter db 13,10,"Please Enter String : ","$"  
same db 13,10,13,10,"Your given String Is : ","$" 
reverse db 13,10,13,10,"Your Reversed String Is : ","$"  
true db 13,10,13,10, "Your String is PALINDROME","$"
false db 13,10,13,10, "Your String is NOT a PALINDROME","$"

.code  
mov ax,@data
mov ds,ax

mov ah, 9
lea dx,enter 
int 21h

mov bx,0     
input:      
    
    mov ah, 1
    int 21h
    
    cmp al,13
    je newLine1 
    
    cmp al,30h
    jae in4
    jmp input
    
in4:
    cmp al,39h
    jbe Correct
  
 
in5:    
    cmp al,41h
    jae in1
    jmp input
    
in1:
    cmp al,5ah
    jbe Correct
    jmp in2
    
in2:
    cmp al,61h
    jae in3
    jmp input
  
in3:
    cmp al,7Ah
    jbe Correct
    jmp input            
       
Correct:    
    mov ai[bx],al
    inc bx
    inc counter
    jmp input
    
newLine1:
   push bx
   mov ah, 9
   lea dx,same 
   int 21h 
   mov cx,counter 
   xor bx,bx
   
output1:   
    mov dl,ai[bx]
    inc bx
    mov ah, 2
    int 21h 
loop output1
   
   
newline2:
   mov ah, 9
   lea dx,reverse 
   int 21h 
   mov cx,counter
   pop bx 
   dec bx
      
output2:   
    mov dl,ai[bx]
    dec bx
    mov ah, 2
    int 21h 
loop output2


xor bx,bx
xor dx,dx
xor ax,ax
dec counter 
mov si, counter 
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