.model small
.stack 100h

.data
a db 'I am LimaA$'
b db 'I love the song November Rain. $'
c db 'This song was sung by Roses. $'

main proc
    
    mov ax , @data
    mov ds , ax 
    
    mov ah , 9
    lea dx , a
    int 21h
    
    mov ah , 2
    mov dl , 8
    int 21h 
    
    mov ah , 2
    mov dl , 9
    int 21h
    
    mov ah , 9
    lea dx , b
    int 21h 
    
    mov ah , 2
    mov dl , 9
    int 21h
    
    mov ah , 9
    lea dx , c
    int 21h 
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp

end main
    
    
    