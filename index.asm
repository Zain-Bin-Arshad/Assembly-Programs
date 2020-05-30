org 100h

.data
word dw 'gonawazgo','$'
input db "Enter Index:$" 
index db ?


.code
mov ax,@data
mov ds,ax

mov ah,9
lea dx,input
int 21h
       
mov ah,1
int 21h   

mov index,al 

mov bx, word+6


mov ah,2
mov dx,bx
int 21h 
       
ret
