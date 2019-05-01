.model small
.stack 100h
.code

main proc
    
    mov cx,49
    mov ax,1
    mov bx,1
    
    label:
    
    add bx,3
    
    add ax,bx
    
    loop label
     
    exit:
    
    mov ah,4ch
    int 21h
    main endp
end main