.data
a db ?

.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    
    mov al , 5
    mov cl , 4
    mov bl , al
    sub bl , 1
    
    
    level:
   
    mul bl
    sub bl , 1
    loop level 
    
    mov a , al
   
    end main 

ret

      