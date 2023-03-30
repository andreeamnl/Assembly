.global _start
.align 2

_start:
    mov X0, #1          // 1 = StdOut
    mov X1, #0          // buffer for the output
    mov X2, #0          // number of bytes to output
    mov X3, #12         // first number to subtract
    sub X3, X3, #7      // subtract the second number
    mov X4, #10         // maximum number of digits to output

    // Convert the difference to ASCII and store it in the buffer
    mov X5, #0          // initialize digit counter
convert_loop:
    sdiv X6, X3, X4     // divide by 10
    msub X7, X6, X4, X3 // multiply by 10 and subtract from the original
    add X7, X7, #48     // convert to ASCII digit
    strb W7, [X1], #1   // store the digit in the buffer
    add X5, X5, #1      // increment digit counter
    cmp X3, X4          // check if we're done
    bge convert_loop

    mov X2, X5          // set the number of bytes to output
    bl  write_stdout    // call kernel to print the buffer

    mov X0, #0
    mov X16, #1
    svc #0x80

write_stdout:
    mov X16, #4         // system call number for write
    svc #0x80           // call kernel to write to standard output
    ret                 // return from the function
