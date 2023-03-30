//
// Assembler program to add 2 and 5, multiply the sum by 4, and print it to stdout.
//
// X0-X2 - parameters to Unix system calls
// X16 - Mach System Call function number
//

.global _start			// Provide program starting address to linker
.align 2			// Make sure everything is aligned properly

_start:
    // Add 2 and 5
    mov X3, #2
    mov X4, #5
    add X5, X3, X4

    // Multiply the sum by 4
    mov X6, #4
    mul X5, X5, X6

    // Convert the sum to ASCII and store it in the buffer
    mov X0, #1          // 1 = StdOut
    adr X1, result      // buffer for the output
    mov X2, #0          // number of bytes to output
    mov X7, #10         // maximum number of digits to output
    mov X8, #0          // initialize digit counter
convert_loop:
    sdiv X9, X5, X7    // divide by 10
    msub X10, X9, X7, X5 // multiply by 10 and subtract from the original
    add X10, X10, #48  // convert to ASCII digit
    strb W10, [X1], #1  // store the digit in the buffer
    add X8, X8, #1     // increment digit counter
    cmp X5, X7         // check if we're done
    bge convert_loop

    mov X2, X8          // set the number of bytes to output
    bl  write_stdout    // call kernel to print the buffer

    mov X0, #0
    mov X16, #1
    svc #0x80

write_stdout:
    mov X16, #4         // system call number for write
    svc #0x80           // call kernel to write to standard output
    ret                 // return from the function

result:              .skip  10      // Allocate space for the result buffer
