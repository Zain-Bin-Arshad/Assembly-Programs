    org 100h
.stack 100h

.data
    Take db 13,10,"Enter between(-32767 to 32767): ","$"
    Give db 13,10,"The decimal number output is: ","$"
    total dw 0  
    pro d 10  
    negative db 0

.code

main proc
mov ax,@data
mov ds,ax

mov ah,9
lea dx, Take
int 21h

call decimalIN

mov ah,9
lea dx, Give
int 21h

call decimalOUT

ret

main endp

decimalIN proc
    mov ah,1
    int 21h 
    cmp al,'-'
    jne input ;jne positive
    mov negative, 1
    int 21h 

;positive:
    ;int 21h
    
input:
    cmp al,13
    je endi
    and al,0fh
    push ax    ;user input
    
    mov ax,total
    mul pro    ;now ax contains total*10 
    mov total, ax  ;add total,ax
    pop dx     ;dx = user input
    mov dh, 0
    add total, dx
    
    mov ah,1
    int 21h
    jmp input    
    
     
endi:  
   cmp negative,1
   jne complete
   neg total
   
complete:   
   ret   
      
decimalIN endp
 
decimalOUT proc
            
     xor cx,cx 
     mov bx,total    
     or bx,bx
     jge pos
     mov ah,2
     mov dl,'-'
     int 21h
     
     neg bx
 
pos:
    mov ax,bx
    mov bx,10      
again:  
    xor dx,dx       
    div bx 
    push dx
    inc cx
    cmp ax,0
    jne again
             
    mov ah,2
     
print:
    pop dx
    or dl,30h
    int 21h
loop print       

ret
decimalOUT endp

