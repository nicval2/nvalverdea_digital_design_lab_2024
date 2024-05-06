/* Matrix Addition Program */

.section .data
    matriz1:
        .word 10, 20, 30, 40
        .word 50, 60, 70, 80
        .word 90, 100, 110, 120
        .word 130, 140, 150, 160

    matriz2:
        .word 5, 15, 25, 35
        .word 45, 55, 65, 75
        .word 85, 95, 105, 115
        .word 125, 135, 145, 155

    resultado:
        .space 16*4

.section .text
.globl _start

_start:
    ldr r4, =matriz1         /* Load address of matriz1 */
    ldr r5, =matriz2         /* Load address of matriz2 */
    ldr r6, =resultado       /* Load address of resultado */

    mov r7, #4               /* Initialize row counter */
fila_loop:
    mov r8, #4               /* Initialize column counter */
columna_loop:
    ldr r0, [r4], #4         /* Load element from matriz1 and increment pointer */
    ldr r1, [r5], #4         /* Load element from matriz2 and increment pointer */
    add r2, r0, r1           /* Add the elements */
    str r2, [r6], #4         /* Store the result and increment pointer */
    subs r8, r8, #1          /* Decrement column counter */
    bne columna_loop         /* Loop if column counter is not zero */

    subs r7, r7, #1          /* Decrement row counter */
    bne fila_loop            /* Loop if row counter is not zero */

    /* Exit the program */
    mov r7, #0x1             /* Exit code */
    mov r0, #0x0             /* Status code */
    svc 0                    /* Invoke syscall to exit */
