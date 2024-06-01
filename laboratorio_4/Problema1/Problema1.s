.section .data
array:
    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 
y:
    .word 4


.global _start
_start:
	
    LDR r6, =y     @ Cargar la dirección de y en r6
    LDR r6, [r6]   @ Cargar el valor de y en r6
    LDR r7, =array @ Cargar la dirección base del array en r7
    MOV r5, #0     @ Inicializar índice i a 0

loop:
    LDR r0, [r7, r5, LSL #2] @ Cargar el elemento array[i] en r0
    CMP r0, r6               @ Comparar array[i] con y
    MULGE r0, r0, r6         @ Si array[i] >= y, multiplica r0 por y
    ADDLT r0, r0, r6         @ Si array[i] < y, suma y a r0
    STR r0, [r7, r5, LSL #2] @ Guardar el resultado en array[i]
    ADD r5, r5, #1           @ Incrementar índice i
    CMP r5, #10              @ Comparar i con 10
    BLT loop                 @ Si i < 10, volver al inicio del ciclo

     @Terminación del programa
end:
    B end                   @ Bucle infinito para detener la ejecución
