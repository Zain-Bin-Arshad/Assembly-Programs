org 100h

.data

str DW "gonawazgo"
str1 Db ?

.code
mov bx,offset str
mov cx,9

print:
mov ah,2
mov dl,[bx]
inc bx
int 21h          ;print assembly
loop print

mov ah,2
mov al,0Ah       
mov dl,al
int 21h          ;new line
        
mov ah,2
mov al,0Dh       
mov dl,al
int 21h          ;start of the line

mov ah,1
int 21h          ;enter the index
sub al,30h
mov dh,al

mov ah,2
mov al,0Ah       
mov dl,al
int 21h          ;new line
    
mov ah,2
mov al,0Dh       
mov dl,al
int 21h          ;start of the line

mov bx,offset str
mov cl,dh        ;loop counter transfer

prints:
mov ah,2
mov dl,[bx]
inc bx
inc str1
int 21h          ;print the non-converted letter
loop prints

mov ah,2
mov dl,[bx]
sub dl,20h 
inc bx
int 21h          ;print the converted letter

mov cl,8
sub cl,str1
dec cl

cmp cl,bx[8]
jl return 
jmp remaining

remaining:
convert:
mov ah,2
mov dl,[bx]
inc bx
int 21h          ;print the remaining letter (if any)
loop convert

return:
ret