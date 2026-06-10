    .section .data
msg:    .ascii "Hello from GAS!\n"
len = . - msg

    .section .text
    .global _start
_start:
    movl $4, %eax        # sys_write
    movl $1, %ebx        # stdout (file descriptor 1)
    movl $msg, %ecx      # pointer to message
    movl $len, %edx      # message length
    int $0x80            # interrupt -> kernel

    movl $1, %eax        # sys_exit
    movl $0, %ebx        # exit code 0
    int $0x80
