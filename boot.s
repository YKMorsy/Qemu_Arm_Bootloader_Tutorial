.global _start

.section .text
_start:
    ldr r0, =message
print_loop:
    ldrb r1, [r0], #1
    cmp r1, #0
    beq done
    bl uart_putc
    b print_loop
done:
    b .

uart_putc:
    // Wait for UART to be ready (poll uart flag register UART0_FR)
    ldr r2, =0x101f1018   	// UART0_FR
wait:
    ldr r3, [r2]		// read UART0_FR into r3
    tst r3, #0x20          	// test if TXFF bit 5 is set
    bne wait			// wait until not set
    ldr r2, =0x101f1000    	// UART0_DR
    str r1, [r2]		// write character to uart data register
    bx lr			// return with link register

.data
message:
    .asciz "Hello from bare-metal ARM!\n"
