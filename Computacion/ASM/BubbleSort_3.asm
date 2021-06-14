INCLUDE 'emu8086.inc'   ; [1]
ORG 100h

; VARIABLES
;serie DB 15, 12, 8, 5, 37, 255, 2, 0
          
; PROGRAMA

MOV     cx, 7           ; asignar a CX un 7 (por los 8 elementos del array)

ciclo1: ; ---------------------------------------------------------------------
PUSH    cx              ; poner en la pila el valor de CX (un 7)
MOV     si, 0           ; resetear
MOV     di, 0           ; resetear

ciclo2: ; ---------------------------------------------------------------------
INC     di              ; incrementar DI para comparar la siguiente posici�n
MOV     al, serie[si]   ; pasar el valor que se encuentra en SI a AL
CMP     al, serie[di]   ; comparar con el valor en DI

JA      intercambio     ; (JUMP ABOVE) si el primer operador es mayor, ir a...
JB      continuar       ; (JUMP BELOW) si el primer operador es menor, ir a...

intercambio:
MOV     ah, [di]        ; AH = 12
MOV     [di], al        ; DI = 15 => (escribiendo en serie)
MOV     [si], ah        ; SI = 12 => (escribiendo en serie)

continuar:
INC     si              ; ...ahora apunta a 12
LOOP    ciclo2          ; decrementa CX (=6), si CX <> 0, salta a etiqueta.
POP     cx              ; recompone CX=7
LOOP    ciclo1          ; decrementa CX(=6)

RET

serie DB 15, 12, 8, 5, 37, 255, 2, 0

END