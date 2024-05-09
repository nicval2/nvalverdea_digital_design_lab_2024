.global _start

.section .text
_start:
    /* Calcular Fibonacci hasta el número x */
    mov r0, #5        /* Número hasta el cual calcular Fibonacci */
    bl fibonacci       /* Llamar a la función Fibonacci */
    bl print_result    /* Imprimir el resultado */

    /* Salir del programa */
    mov r7, #1         /* Número de llamada para salir (syscall) */
    mov r0, #0         /* Código de retorno */
    svc #0             /* Llamar al sistema */

/* Función para calcular Fibonacci */
fibonacci:
    push {r4, r5, lr} /* Guardar r4, r5 y lr en la pila */
    mov r4, #0         /* Primer número de Fibonacci */
    mov r5, #1         /* Segundo número de Fibonacci */
    cmp r0, #0         /* Verificar si el número es 0 */
    beq end_fibonacci /* Si es 0, ir al final */
fibonacci_loop:
    add r2, r4, r5     /* r2 = r4 + r5 (próximo número de Fibonacci) */
    mov r4, r5         /* r4 = r5 */
    mov r5, r2         /* r5 = r2 */
    sub r0, r0, #1     /* Decrementar el contador */
    cmp r0, #0         /* Verificar si se llegó al número deseado */
    bne fibonacci_loop /* Si no, volver al bucle */
end_fibonacci:
    mov r0, r2         /* Mover el resultado a r0 */
    pop {r4, r5, pc}   /* Restaurar r4, r5 y lr de la pila y regresar */

/* Función para imprimir el resultado */
print_result:
    mov r7, #1         /* Número de llamada para imprimir (syscall) */
    svc #0             /* Llamar al sistema */
    mov r0, #'\n'      /* Carácter de nueva línea */
    bl putchar         /* Imprimir nueva línea */
    bx lr              /* Retornar */

/* Función para imprimir un carácter */
putchar:
    mov r7, #4         /* Número de llamada para imprimir (syscall) */
    svc #0             /* Llamar al sistema */
    bx lr              /* Retornar */
