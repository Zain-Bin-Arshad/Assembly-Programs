
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt



org 100h
.data
ai db 50 dup(?)
ao db 50 dup(?) 
address dw ?
counter db 0 
enter db 13,10,"Please Enter characters !",13,10,"$"
reverse db 13,10,13,10,"Your Reserved Input Is : ","$"  
true db 13,10,13,10, "Your Input is PALINDROME","$"
false db 13,10,13,10, "Your Input is NOT a PALINDROME","$"
.code

main proc 
mov ah, 9
lea dx,enter 
int 21h
    
mov ah, 1
int 21h
mov bx,0  

input:
    cmp al,13
   	je newLine
    push ax
    mov ai[bx],al
    inc bx            
    inc counter
    int 21h
    jmp input

newLine:
   mov ah, 9
   lea dx,reverse 
   int 21h 
   mov cl, 0
   mov bx,0   
  
call output   
   
call palindrome   
   
main endp   
   
   
output proc 
    
    pop address  
OrepeatO:       
    cmp cl,counter
    je set
    pop ax
    mov ao[bx],al
    inc bx
    mov ah, 2
    mov dl, al
    int 21h 
    inc cl
    jmp OrepeatO
    
set:
    mov dl,0
    mov bx,0 
    push address
    ret
output endp

palindrome proc
  pop address
  
PrepeatP:
    
     cmp dl,counter 
     je yes
     mov al,ai[bx]
     mov cl,ao[bx] 
     inc dl
     inc bx
     cmp al,cl
     je PrepeatP 
     mov ah, 9
     lea dx,false 
     int 21h 
     push address
     ret
          
yes:  
   mov ah, 9
   lea dx,true 
   int 21h 
   push address
   ret

palindrome endp 

end main