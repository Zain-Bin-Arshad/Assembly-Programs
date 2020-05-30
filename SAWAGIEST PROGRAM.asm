
org 100h

xor ax,ax
mov es,ax
mov es:[8*4],FARAN_CHUTIYA
mov es:[8*4+2],cs

int 8
ret
 
FARAN_CHUTIYA: 
    MOV AL,'@'
    MOV AH,0EH
    INT 10H         

    mov ah,01
    int 16h 
    jnz PHUPHO_KI_MARI_BUND_BUND
	jmp FARAN_CHUTIYA
	
PHUPHO_KI_MARI_BUND_BUND:
    cmp al,'p'
    mov ah,00
    int 16h
    je MAM_KO_MAIL_KARO 
    cmp al,'P'
    je MAM_KO_MAIL_KARO 
    jmp FARAN_CHUTIYA	
	
MAM_KO_MAIL_KARO:
    mov ah,1
    int 21h
    cmp al,'p'
    je FARAN_CHUTIYA
    cmp al,'P'
    je FARAN_CHUTIYA
    jmp MAM_KO_MAIL_KARO	
ret




