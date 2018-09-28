.MODEL small
.DATA
cadena DB  'El resultado es: $'
num1 DB ?
num2 DB ?
.code
programa: 
;iniciar programa
    MOV AX,@DATA    ;Se obtiene direccion dde inicio del segmento de datos
    MOV DS, AX   ;Asignamos al registro la direccion de inicio de segmento
        ;leer registro
        XOR AX,AX
        MOV ah,01h
        int 21h
        SUB al,30h ;obtiene el valor real de la lectura del numero
        MOV num1,al
        XOR AX,AX ;limpia el registro AX para eliminar basura.
        MOV ah,01h
        int 21h
        sub al,30h ;obtiene el valor real de la lectura del numero
        mov num2,al
        ;imprimir valores por referencia
        XOR DX,DX ;limpia el registro DX para eliminar basura.
        XOR AX,AX ;limpia el registro AX para eliminar basura.
        MOV ah,02h
        MOV dl,num1
        ADD dl,30h ;obtiene el valor real de la escritura del numero
        int 21h
        XOR DX,DX ;limpia el registro DX para eliminar basura.
        XOR AX,AX ;limpia el registro AX para eliminar basura.
        MOV ah,02h
        MOV dl,num2
        ADD dl,30h ;obtiene el valor real de la lectura del numero
        int 21h
        ;imprimir nueva linea
        MOV DL, 10
        MOV AH, 02h
        INT 21H
        ;suma
        MOV Al,num1
        MOV Bl,num2
        ADD Al,Bl ; suma de registros Al, Bl, guardando el resultado en Al
        XOR AH,AH ;limpia el registro de AH para eliminar basura.
        ;imprimir dos digitos
        MOV BL,10
        DIV BL
        MOV BH,AH ;BH almacena el residuo
        ADD AL,30h ;obtiene el valor real de la lectura del numero
        MOV DL,AL ;preparando para imprimir decenas
        MOV AH,02h
        INT 21h
        ;imprimir nueva linea
        MOV DL, 10
        MOV AH, 02h
        INT 21H
        ;imprimir unidades
        XOR AH,AH  ;limpia el registro de AH para eliminar basura.
        MOV AH,BH
        ADD AH,30h
        MOV DL,AH
        MOV AH,02h
        INT 21h
        ;imprimir nueva linea
        MOV DL, 10
        MOV AH, 02h
        INT 21H
        ;resta
        MOV Al,num1
        MOV Bl,num2
        SUB Al,Bl; se suma num1-num2 (se guarda en Al)
        ADD Al,30h
        MOV Dl,Al ;se prepara para imprimir
        MOV AH, 02h
        INT 21h
        ;imprimir nueva linea
        MOV DL, 10
        MOV AH, 02h
        INT 21H
        ;multiplicacion
        MOV AL,num1
        MOV BL,num2
        MUL BL
        ;imprimir dos digitos
        MOV BL,10
        DIV BL
        MOV BH,AH ;BH almacena el residuo
        ADD AL,30h ;obtiene el valor real de la lectura del numero
        MOV DL,AL ;preparando para imprimir decenas
        MOV AH,02h
        INT 21h
        ;imprimir nueva linea
        MOV DL, 10
        MOV AH, 02h
        INT 21H
        ;imprimir unidades
        XOR AH,AH  ;limpia el registro de AH para eliminar basura.
        MOV AH,BH
        ADD AH,30h ;obtiene el valor real de la lectura del numero
        MOV DL,AH
        MOV AH,02h
        INT 21h
        ;imprimir nueva linea
        MOV DL, 10
        MOV AH, 02h
        INT 21H
        ;Division
        MOV AL,num1 ;almacena el valor de num1 en el registro AL
        MOV BL,num2 ;almacena el valor de num2 en el registro BL
        XOR AH,AH  ;limpia el registro de AH para eliminar basura.
        DIV BL
        ADD AL,30h ;obtiene el valor real de la lectura del numero
        MOV DL,AL
        MOV AH,02h
        INT 21h
;finalizar el programa
    MOV AH, 4Ch
    INT 21h
.STACK
END programa