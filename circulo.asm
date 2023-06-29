org 100h 

inix equ 100
iniy equ 100
inicio equ 4

main proc far
    mov al, 13h
    mov ah, 0
    int 10h     ; set modo grafico

    mov al, 1111b

    mov cx, inix
    mov dx, iniy

    ; primer cuadrante 
    
     ; parte inferior del cuadrante
     mov bx, inicio
     push bx

     ci_inf: call imprimir_pixel
    
        
        dec dx
        dec bx
        cmp bx, 0
        jnz ci_inf
        
        pop bx
        dec bx
        push bx
        inc cx
        cmp bx, 0
        jnz ci_inf                        
        
        ; parte media del cuadrante
        mov bx, inicio
        
     ci_mid: call imprimir_pixel
        
        dec dx
        inc cx
        dec bx
        cmp bx, 0 
        jnz ci_mid
        
        ; parte superior del cuadrante
        pop bx
        inc bx
        push bx
     
     ci_sup: call imprimir_pixel    
        
        inc cx
        dec bx
        cmp bx, 0
        jnz ci_sup
        
        pop bx
        inc bx
        push bx
        dec dx
        cmp bx, inicio+1
        jnz ci_sup 
        
        
     ; segundo cuadrante 
     
     ; parte superior del cuadrante
     inc dx
     pop bx
     dec bx
     push bx
     
     cii_sup: call imprimir_pixel
        
        inc cx
        dec bx
        cmp bx, 0 
        jnz cii_sup
        
        pop bx
        dec bx
        push bx
        inc dx
        cmp bx, 0
        jnz cii_sup  
        
     ; parte media del cuadrante 
     mov bx, inicio
     
     cii_mid: call imprimir_pixel
     
        inc dx
        inc cx
        dec bx
        cmp bx, 0
        jnz cii_mid 
        
     ; parte inferior del cuadrante
     pop bx
     inc bx
     push bx
     
     cii_inf: call imprimir_pixel
        
        inc dx 
        dec bx
        cmp bx, 0
        jnz cii_inf
        
        pop bx
        inc bx
        push bx
        inc cx
        cmp bx, inicio+1
        jnz cii_inf
        
    ; tercer cuadrante 
    
    ; parte superior del cuadrante 
    dec cx
    pop bx
    dec bx
    push bx
    
    ciii_sup: call imprimir_pixel
        
        inc dx
        dec bx
        cmp bx, 0
        jnz ciii_sup 
        
        pop bx
        dec bx
        push bx
        dec cx
        cmp bx, 0 
        jnz ciii_sup
        
    ; parte media del cuadrante
    mov bx, inicio
    
    ciii_mid: call imprimir_pixel
    
        inc dx
        dec cx
        dec bx
        cmp bx, 0 
        jnz ciii_mid
        
    ; parte inferior del cuadrante
    pop bx
    inc bx
    push bx
    
    ciii_inf: call imprimir_pixel
    
        dec cx
        dec bx
        cmp bx, 0
        jnz ciii_inf
        
        pop bx
        inc bx
        push bx
        inc dx
        cmp bx, inicio+1
        jnz ciii_inf
        
    ; cuarto cuadrante 
    
    ; parte inferior del cuadrante 
    dec dx
    pop bx
    dec bx
    push bx
    
    civ_inf: call imprimir_pixel
        
        dec cx
        dec bx
        cmp bx, 0
        jnz civ_inf
        
        pop bx
        dec bx
        push bx
        dec dx
        cmp bx, 0 
        jnz civ_inf
        
    ; parte media del cuadrante
    mov bx, inicio
    
    civ_mid: call imprimir_pixel
    
        dec dx
        dec cx
        dec bx
        cmp bx, 0 
        jnz civ_mid
        
    ; parte superior del cuadrante
    pop bx
    inc bx
    push bx
    
    civ_sup: call imprimir_pixel
    
        dec dx
        dec bx
        cmp bx, 0
        jnz civ_sup
        
        pop bx
        inc bx
        push bx
        dec cx
        cmp bx, inicio+1
        jnz civ_sup
        
        
    mov ah, 4ch
    int 21h 
main endp

imprimir_pixel proc 
    mov ah, 0ch
    int 10h
    
    ret
imprimir_pixel endp   

