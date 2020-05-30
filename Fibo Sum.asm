org 100h

.data
give db 13,10,"ENTER A POSITIVE INTEGER : " ,"$";
take db 13,10,13,10, "THE FIBONNACI SEQUENCE SUM IS: ","$"

.code
main proc
    mov ah, 9
    lea dx, give
    int 21h
    mov ah, 1
    int 21h
    and ax,0fh
    push ax
    call FACTORIAL
    mov bx, ax
    mov ah, 9
    lea dx, take
    int 21h
    xor cx,cx
    mov ax,bx
    mov bx,10
againN:  
    xor dx,dx      
    div bx 
    push dx
    inc cx
    cmp ax,0
    jne againN             
    mov ah,2
printN: 
    pop dx
    or dl,30h
    int 21h
loop printN    
ret
main endp

FACTORIAL proc 
  
    push bp
    mov bp, sp
    cmp [bp+4], 1
    jg CLOSE
    mov ax, 1
    jmp RETURN
 CLOSE:
    mov bx, [bp+4]
    dec bx
    push bx
    call FACTORIAL
    mul [bp+4] 
 RETURN:
    pop bp
    ret 2
FACTORIAL endp
