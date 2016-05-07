	.file	"hw3.s"  
	.text
########### pow2 ###############
	.globl	pow2

pow2:
### Start function
        movq    $0, %rax    # result goes in rax

        movl    $1, %eax    # Set the smallest bit of eax
        movl    %edi, %ecx  # Copy from the argument to the CL register, which is the smallest byte of ecx
        sall    %cl, %eax   # Shift left by 1 CL times, equivalent to multiplying by 2 CL times

### End function

        ret




########### mypow ###############
        .globl  mypow
mypow:
### Start function
        movq    $0, %rax        # result goes in rax
        movl    $1, %eax        # move 1 to the return

        testl   %esi, %esi      #
        jz      mypow_done      # If y is not yet 0, keep looping
mypow_loop:
        dec     %esi            # Decrement y

        imul    %edi, %eax      # Multiply the return by x
        testl   %esi, %esi      #
        jnz     mypow_loop      # If y is not yet 0, keep looping

mypow_done:

### End function

        ret

########### sum ###############
        .globl  sum
sum:
### Start function
        movq    $0, %rax   # result goes in rax

        addl    %edi, %eax
        addl    %esi, %eax

### End function

        ret

########### sum2 ###############	
	.globl	sum2
sum2:

	pushq  %rbp       # push the base pointer on the stack
	movq  %rsp, %rbp  # move the previous stack pointer to the new base pointer

### Start function
        movq    $0, %rax   # result goes in rax

        addl    %edi, %eax
        addl    %esi, %eax
        addl    %edx, %eax
        addl    %ecx, %eax
        addl    %r8d, %eax
        addl    %r9d, %eax

        addl    16(%rsp), %eax #NEEDS COMMENT



### End function
	popq %rbp         # pop the base pointer and load it into %rbp
	ret               # pop the instruction pointer into %rip

########### f1 ###############
        .globl  f1
f1:

# Pointer to an int is passed into rdi

### Start function
        movq    $0, %rax

#       These use an index
#       movq    $0, %rsi                # rsi used to track the current index
#       movq    (%rdi, %rsi, 4), %rcx   # rcx used as a temporary to compare
#       testl   %ecx, %ecx
#       jz      f1_done         # If the int at the pointer is 0, the array is empty


#       The final version uses pointer arithmetic
        movq    (%rdi), %rcx
        testl   %ecx, %ecx      # Important to use ecx instead of rcx
        jz      f1_done         # If the int at the pointer is 0, the array is empty

f1_loop:

        inc     %rax # Increment the return value
#       inc     %rsi # Increment the index

        addq    $4, %rdi #Move the pointer to the next int in the array

#       These use an index
#       movq    (%rdi, %rsi, 4), %rcx # rcx used as a temporary to compare
#       testl   %ecx, %ecx
#       jnz     f1_loop         # If the int at the pointer is not 0, keep looping

#       The final version uses pointer arithmetic
        movq    (%rdi), %rcx
        testl   %ecx, %ecx      # Important to use ecx instead of rcx
        jnz     f1_loop         # If the int at the pointer is not 0, keep looping

f1_done:

### End function

	ret



########### f2 ###############
        .globl  f2
f2:
### Start function

        movq    $0, %rax

        movq    (%rdi), %rcx
        testl   %ecx, %ecx      # Important to use ecx instead of rcx
        jz      f2_done         # If the int at the pointer is 0, the array is empty

f2_loop:
        cmpl    %ecx, %eax      # Current value - maximum
        jns     f2_not_higher

        movl    %ecx, %eax

f2_not_higher:

        addq    $4, %rdi #Move the pointer to the next int in the array

        movq    (%rdi), %rcx
        testl   %ecx, %ecx      # Important to use ecx instead of rcx
        jnz     f2_loop         # If the int at the pointer is not 0, keep looping

f2_done:


### End function

        ret



########### f3 ###############
        .globl  f3
f3:
### Start function
        movq    $0, %rax        # rax will hold max index

        movq    $0, %rsi        # used for tracking the highest value
        movq    $0, %rdx        # used for tracking the current index

        movq    (%rdi), %rcx
        testl   %ecx, %ecx      # Important to use ecx instead of rcx
        jz      f3_done         # If the int at the pointer is 0, the array is empty

f3_loop:
        cmpl    %ecx, %esi      # Current value - maximum
        jns     f3_not_higher

        movl    %ecx, %esi      # copy the current into the maximum value
        movq    %rdx, %rax      # copy the current index into the highest index

f3_not_higher:
        inc     %rdx            #increment the index
        addq    $4, %rdi        #Move the pointer to the next int in the array

        movq    (%rdi), %rcx
        testl   %ecx, %ecx      # Important to use ecx instead of rcx
        jnz     f3_loop         # If the int at the pointer is not 0, keep looping

f3_done:

### End function

	ret

########### f4 ###############		
	.globl	f4
f4:
### Start function
        movq    $0, %rax    # clear out rax



### End function

	ret


########### f5 ###############
        .globl  f5
f5:
### Start function
        movq    $0, %rax    # clear out rax

        movq    (%rdi), %rcx
        testl   %ecx, %ecx      # Important to use ecx instead of rcx
        jz      f5_done         # If the int at the pointer is 0, the array is empty

f5_loop:

        addl    %ecx, %eax
        addq    $4, %rdi        #Move the pointer to the next int in the array

        movq    (%rdi), %rcx
        testl   %ecx, %ecx      # Important to use ecx instead of rcx
        jnz     f5_loop         # If the int at the pointer is not 0, keep looping

f5_done:


### End function

        ret


########### f6 ###############			
	.globl	f6
f6:
### Start function
        movq    $0, %rax    # clear out rax

### End function

	ret

	

	
