.model small
.stack 100h

.data

promt_1 db 'Enter the string : $'
promt_2 db 10 , 13 , 'The string in reverse order : $'
count dw 0

.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    mov ah , 9
    lea dx ,  promt_1
    int 21h
    
    xor cx , cx
    mov ah , 1
    
    @input:
    
    int 21h  
    
    cmp al , 0dh 
    je @end_input
    
    push ax 
    
    inc cx
    
    jmp @input
    
    @end_input:
    
    mov bx , 50h
    xchg bx , sp
    
    push 0020h
    
    xchg bx , sp
    inc count
    
    @loop_1:
    
    pop dx
    
    xchg bx , sp
    
    push dx
    
    xchg bx , sp
    
    inc count
    
    loop @loop_1
    
    lea dx , promt_2
    mov ah , 9
    int 21h
    
    mov cx , count
    mov count , 0
    
    push 0020h
    
    inc count
    
    @output:
    
    xchg bx , sp
    
    pop dx
    
    xchg bx , sp
    
    cmp dl , 20h
    
    jne @skip_printing
    
    mov ah , 2
    
    @loop_2:
    
    pop dx
    int 21h
    
    dec count
    jnz @loop_2
    
    mov dx , 0020h
    
    @skip_printing:
    
    push dx 
    inc count
    
    loop @output
    
    mov ah , 4ch
    int 21h
    main endp
end main