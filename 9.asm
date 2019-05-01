.model small
.stack 100h 

.data
a db 10,13,'***********$'
c db '****$'
b db ?

.code  

main proc  
    
    mov ax , @data
    mov ds , ax
    
    mov ah , 2
    mov dl , 63
    int 21h
      
    mov ah , 1
    int 21h
    mov bh , al 
    
    mov ah , 1
    int 21h
    mov bl , al
     
    mov ah , 1
    int 21h
    mov b , al
    
    mov ah , 9
    lea dx , a
    int 21h 
    int 21h
    int 21h
    int 21h
    int 21h 
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h 
    
    mov ah , 9
    lea dx , c
    int 21h 
    
    mov ah , 2
    mov dl , bh
    int 21h
      
    mov ah , 2
    mov dl , bl
    int 21h 
    
    mov ah , 2
    mov dl , b
    int 21h
     
    mov ah , 9
    lea dx , c
    int 21h
     
    mov ah , 9
    lea dx , a
    int 21h 
    int 21h
    int 21h
    int 21h
    int 21h 
    
    mov ah , 2
    mov dl , 7
    int 21h
    
    exit: 
    
    mov ah , 4ch
    int 21h
    main endp
end main
