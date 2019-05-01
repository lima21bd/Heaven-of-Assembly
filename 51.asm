.model small
.stack 100h

.data
a db 'Enter First Digit: $'
b db 10, 13, 'Enter Second Digit: $'
c db 10, 13, 'Enter Third Digit: $'
d db 10, 13, 'Enter Fourth Digit: $'
e db 10, 13, 'Total: $'

.code

main proc
    
    mov ax , @data
    mov ds , ax 
    
    mov ah , 9
    lea dx , a
    int 21h
    
    mov ah , 1
    int 21h
    mov bl , al
    
    mov ah , 9
    lea dx , b
    int 21h
    
    mov ah , 1
    int 21h
    mov bh , al
    
    mov ah , 9
    lea dx , c
    int 21h
    
    mov ah , 1
    int 21h
    mov cl , al
    
    mov ah , 9
    lea dx , d
    int 21h
    
    mov ah , 1
    int 21h
    mov ch , al 
    
    add bl , bh
    sub bl , 48
    
    add bl , cl
    sub bl , 48
    
    add bl , ch
    sub bl, 48
    
    mov ah , 9
    lea dx , e
    int 21h
    
    mov ah , 2
    mov dl , bl
    int 21h
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp

end main
    
    
