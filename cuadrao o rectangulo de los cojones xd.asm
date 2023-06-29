org 100h  

   anchura equ 30
   altura equ 20  
   inix equ 100
   iniy equ 100

main proc far
    mov ax, @data
    mov ds, ax 
    
    mov al, 13h ; poner modo grafico
    mov ah, 0
    int 10h
    
    mov al, 1100b ; poner color para la figura
    mov cx, inix  ; posicion x
    mov dx, iniy  ; posicion y 
    ; Linea superior
l1: mov ah, 0ch   ; Interrupcion para colorear el pixel
    int 10h
    
    inc cx
    cmp cx, inix+anchura
    jnz l1
        
    ; Linea derecha
l2: mov ah, 0ch
    int 10h
    
    inc dx
    cmp dx, iniy+altura
    jnz l2 
    
    ; Linea inferior
l3: mov ah, 0ch
    int 10h
    
    dec cx
    cmp cx, inix
    jnz l3
    
    ; Linea izquierda
l4: mov ah, 0ch
    int 10h
    
    dec dx
    cmp dx, iniy
    jnz l4         
    
           
    mov ah, 4ch ; Interrupcion para cerrar el programa correctamente
    int 21h     
    main endp
end main