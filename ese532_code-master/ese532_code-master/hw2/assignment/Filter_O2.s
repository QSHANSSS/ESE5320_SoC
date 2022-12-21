    .arch armv8-a
    .file   "Filter.c"
    .text
    .align  2
    .p2align 3,,7
    .global Filter_horizontal
    .type   Filter_horizontal, %function

Filter_horizontal:
.LFB22:
    .cfi_startproc

    ;************************************************************************************
    ; When Filter_horizontal is called, register x0 holds the Input pointer parameter,
    ; and register x1 holds the Output pointer parameter.
    ;************************************************************************************
.L2:
    mov x8, 61354                   ; x8 = 61354
    mov x9, x0                      ; x9 = (Input + Y*INPUT_WIDTH + X), where Y = 0, X = 0.
    movk    x8, 0x16d, lsl 16       ; x8 = x8 + 365 = 23981994 = INPUT_HEIGHT*(1 + OUTPUT_WIDTH)
    mov x0, 5994                    ; x0 = OUTPUT_WIDTH
    adrp    x5, .LANCHOR0           ; x5 = Coefficients address (part 1)
    add x7, x1, x0                  ; x7 = (Output + (Y+1)*OUTPUT_WIDTH + X), where Y = 0, X = 0.
    mov x10, x0                     ; x10 = OUTPUT_WIDTH
    add x8, x1, x8                  ; x8 = Output + INPUT_HEIGHT*(1 + OUTPUT_WIDTH)
    add x5, x5, :lo12:.LANCHOR0     ; x5 = Coefficients address (part 2)
    mov x12, -5994                  ; x12 = -OUTPUT_WIDTH
    mov x11, 6000                   ; x11 = INPUT_WIDTH
.L3:                                ; Loop1
    add x6, x7, x12                 ; x6=addr(output), x6 is address index of output array
    mov x4, x9                      ; x4=addr(input) x4 is address index of input array
    .p2align 3,,7                   ;
.L7:                                ; Loop2
    mov x0, 0                       ; x0=0, the first address of input array
    mov w1, 0                       ; w0=0, w0 is sum
    .p2align 3,,7
.L4:                                ; Loop3
    ldrb    w3, [x4, x0]            ; w3=load value from addr(x4+x0), w3 is the element of input array
    ldr w2, [x5, x0, lsl 2]         ; w2=load from addr(x5 + x0 << 2), w2 is the element of Coefficients array
    add x0, x0, 1                   ; x0=x0+1
    cmp x0, 7                       ; compare if Coefficient_index=7
    madd    w1, w3, w2, w1          ;  w1=w1+w3*w2, sum=sum+input[]*Coefficients
    bne .L4                         ; if x0!=length of kernel array, execute this command, jump to .L4, enter the loop3 again
    lsr w1, w1, 8                   ; w1=w1<<8,sum=sum<<8
    strb    w1, [x6], 1             ; store lower 8 bits of w1 to addr[x6],then x6=x6+1
    add x4, x4, 1                   ; x4=x4+1, move to the next index of input array 
    cmp x7, x6                      ; compare if x7=x6
    bne .L7                         ; if x6!=x7, execute this command and jump to .L7
    add x7, x7, x10                 ; x7=x7+x10; x7 point to next row of element in output array
    add x9, x9, x11                 ; x9=x9+x11, x9 point to next row of element in input array
    cmp x7, x8                      ; compare if x7=x8
    bne .L3                         ; if x7!=x8, jump to .L3, enter the Loop1 again
    ret                             
    .cfi_endproc
.LFE22:
    .size   Filter_horizontal, .-Filter_horizontal
    .align  2
    .p2align 3,,7
    .global Filter_vertical
    .type   Filter_vertical, %function
Filter_vertical:
.LFB23:
    .cfi_startproc
.L11:
    adrp    x6, .LANCHOR0
    mov x9, x0
    mov x8, x1
    add x6, x6, :lo12:.LANCHOR0
    mov w10, 0
    mov x5, 5994
.L12:
    mov x7, 0
    .p2align 3,,7
.L16:
    add x1, x9, x7
    mov x0, 0
    mov w2, 0
    .p2align 3,,7
.L13:
    ldrb    w4, [x1]
    add x1, x1, x5
    ldr w3, [x6, x0, lsl 2]
    add x0, x0, 1
    cmp x0, 7
    madd    w2, w4, w3, w2
    bne .L13
    lsr w2, w2, 8
    strb    w2, [x8, x7]
    add x7, x7, 1
    cmp x7, x5
    bne .L16
    add w10, w10, 1
    add x8, x8, x7
    cmp w10, 3994
    add x9, x9, x7
    bne .L12
    ret
    .cfi_endproc
.LFE23:
    .size   Filter_vertical, .-Filter_vertical
    .align  2
    .p2align 3,,7
    .global Filter
    .type   Filter, %function
Filter:
.LFB24:
    .cfi_startproc
    stp x29, x30, [sp, -32]!
    .cfi_def_cfa_offset 32
    .cfi_offset 29, -32
    .cfi_offset 30, -24
    mov x29, sp
    stp x19, x20, [sp, 16]
    .cfi_offset 19, -16
    .cfi_offset 20, -8
    mov x20, x0
    mov x0, 55360
    mov x19, x1
    movk    x0, 0x16d, lsl 16
    bl  malloc
    mov x13, x0     ; x13 = Temp
    mov x1, x13     ; x1 = Temp (aka Output)
    mov x0, x20     ; x0 = Input
    bl  Filter_horizontal
    mov x0, x13
    mov x1, x19
    bl  Filter_vertical
    ldp x19, x20, [sp, 16]
    mov x0, x13
    ldp x29, x30, [sp], 32
    .cfi_restore 30
    .cfi_restore 29
    .cfi_restore 19
    .cfi_restore 20
    .cfi_def_cfa_offset 0
    b   free
    .cfi_endproc
.LFE24:
    .size   Filter, .-Filter
    .global Coefficients
    .data
    .align  3
    .set    .LANCHOR0,. + 0
    .type   Coefficients, %object
    .size   Coefficients, 28
Coefficients:
    .word   2
    .word   15
    .word   62
    .word   98
    .word   62
    .word   15
    .word   2
    .ident  "GCC: (GNU) 9.2.0"
    .section    .note.GNU-stack,"",@progbits
