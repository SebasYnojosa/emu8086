
;****************************
; Operaciones aritmeticas
;****************************
.model small
.stack 64
.data  
   mensaje1 DB "Ingrese numero 1:$"
   mensaje2 DB 10,13,"Ingrese numero 2:$"
   mensaje3 DB 10,13,"Suma:$" 
   mensaje4 DB 10,13,"Resta:$"
   mensaje5 DB 10,13,"Multiplicacion:$"     
   mensaje6 DB 10,13,"Division:$"
   num1 DB 0  ;Variable para respaldar el numero ingresado por el usuario.
   num2 DB 0  ;Variable para respaldar el numero ingresado por el usuario.

   r    DB 3 DUP(' '),'$' ; variable para mostrar resultados de suma,multiplicacion y division
   b    DB 10             ; divisor -- para separar los digitos del resultados de AL

   suma DB 0 
   resta DB 0  
   mult  DB 0
   divv  DB 0
                                       
.code  
   
   MOV AX, @DATA                                                                                                                
   MOV DS, AX
      
   ; Muestra mensaje1
   MOV DX,offset mensaje1    
   MOV AH,09h  ; Funcion que imprime en pantalla 
   INT 21h ; ejecuta la funcion
   
   ;****************************
   ; Pide el numero 1
   ;****************************

   MOV AH,01h  
   INT 21h     
   
   ; la entrada se recibe como codigo ascii
   sub al,30h ; 
   mov num1,al ;guardamos el numero ingresado en num1
   
   ; Muestra mensaje2
   MOV DX,offset mensaje2    
   MOV AH,09h  ; Funcion que imprime en pantalla 
   INT 21h ; ejecuta la funcion
         
   ;****************************
   ; Pide el numero 2
   ;****************************

   MOV AH,01h  ;Pedir el número al usuario
   INT 21h
   
   ; la entrada se recibe como codigo ascii
   SUB AL,30h ; la entrada se recibe como codigo ascii
   MOV num2,AL ;guardamos el numero ingresado en num2
 
   ;****************************
   ; Suma                       
   ;****************************
 
   ; MOV AL,num1
    ADD AL, num1  
    MOV suma, AL
    
   ;****************************
   ; Muestra mensaje3
   ;****************************

   MOV DX,offset mensaje3    
   MOV AH,09h  ; Funcion que imprime en pantalla 
   INT 21h ; ejecuta la fu ncion
   
   ;****************************
   ; Muestra Resultado de Suma
   ;****************************

   
   MOV AX, 0    ; limpiar registro
   MOV AL, suma ; pasa resultado de suma
   DIV b        ; esto se hace para separar el numero (Ej:10)
    
   MOV r[0],AL
   MOV r[1],AH
   
   ADD r[0],30h
   ADD r[1],30h
   
   MOV DX,offset r   
   MOV AH,09h  ; Funcion que imprime en pantalla 
   INT 21h ; ejecuta la fu ncion
   
   
   ;****************************
   ; Resta                       
   ;****************************
 
    MOV AL,num1
    SUB AL, num2
    MOV resta, AL
    
   ;****************************
   ; Muestra mensaje4
   ;****************************

   MOV DX,offset mensaje4    
   MOV AH,09h  ; Funcion que imprime en pantalla 
   INT 21h ; ejecuta la fu ncion
   
   ;****************************
   ; Muestra Resultado de resta
   ;****************************

   
   MOV AX, 0
   MOV AL, resta
     
   ADD AL,30h 
   MOV DL,AL 
   MOV AH, 02h
   INT 21h   
   
   ;****************************
   ; Multiplicacion                       
   ;****************************
 
    MOV AL,num1
    MUL num2  
    MOV mult, AL
    
   ;****************************
   ; Muestra mensaje5
   ;****************************

   MOV DX,offset mensaje5    
   MOV AH,09h  ; Funcion que imprime en pantalla 
   INT 21h ; ejecuta la fu ncion
   
   ;****************************
   ; Muestra Resultado de Multiplicacion
   ;****************************

   
   MOV AX, 0    ; limpiar registro
   MOV AL, mult ; pasa resultado de multiplicacion
   DIV b        ; esto se hace para separar el numero (Ej:10)
    
   MOV r[0],AL
   MOV r[1],AH
   
   ADD r[0],30h
   ADD r[1],30h
   
   MOV DX,offset r   
   MOV AH,09h  ; Funcion que imprime en pantalla 
   INT 21h ; ejecuta la fu ncion
   
   ;****************************
   ; Division                       
   ;****************************
    
    MOV AX, 0    ; limpiar registro
    MOV AL,num1
    DIV num2

   
    MOV r[0],AL
    ;MOV r[2],AH
    MOV r[1],' '    
    MOV r[2],' '    
   
    ADD r[0],30h
    ;ADD r[2],30h
   
   
    
   ;****************************
   ; Muestra mensaje6
   ;****************************

   MOV DX,offset mensaje6    
   MOV AH,09h  ; Funcion que imprime en pantalla 
   INT 21h ; ejecuta la fu ncion
   
   ;****************************
   ; Muestra Resultado de Division
   ;****************************

      
   MOV DX,offset r   
   MOV AH,09h  ; Funcion que imprime en pantalla 
   INT 21h ; ejecuta la fu ncion
   

     MOV AH,4CH  ;necesario para terminar el programa
     INT 21H    ; interrupción de salida

END                                          ; Indica el fin del programa
