.model small
.stack 100h

.data

a db 'Original value of AL: $'
b db 10, 13, 'Processed value of AL: $'

.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    mov ah , 9
    lea dx , a
    int 21h
    
    mov al , 31h  ; if need change this line
    mov bl , al
    
    mov ah , 2
    mov dl , al
    int 21h
    
    mov ah , 9
    lea dx , b
    int 21h 
    
    and bl , 0Fh
    
    mov cl , 3
    shl bl , cl
    
    or bl , 30h
    
    mov ah , 2
    mov dl, bl
    int 21h
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main
    
    