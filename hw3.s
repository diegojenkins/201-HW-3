	.file	"hw3.s"  
	.text
########### pow2 ###############
	.globl	pow2

pow2:
### Start function
        movq    $0, %rax    # result goes in rax


### End function

	ret


########### mypow ###############
	.globl	mypow
mypow:
### Start function
	movq    $0, %rax   # result goes in rax

### End function
	.globl	sum

########### sum ###############
	
sum:
### Start function
	movq    $0, %rax   # result goes in rax
### End function

	ret

########### sum2 ###############	
	.globl	sum2
sum2:

	pushq  %rbp       # push the base pointer on the stack
	movq  %rsp, %rbp  # move the previous stack pointer to the new base pointer

### Start function
	movq    $0, %rax   # result goes in rax

### End function
	popq %rbp         # pop the base pointer and load it into %rbp
	ret               # pop the instruction pointer into %rip


########### f1 ###############	
	.globl	f1
f1:
### Start function
        movq    $0, %rax
	
### End function

	ret


########### f2 ###############	
	.globl	f2
f2:
### Start function

        movq    $0, %rax

### End function

	ret

########### f3 ###############		
	.globl	f3
f3:
### Start function
        movq    $0, %rax   # rax will hold max index



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
	.globl	f5
f5:
### Start function
        movq    $0, %rax    # clear out rax

### End function

	ret

########### f6 ###############			
	.globl	f6
f6:
### Start function
        movq    $0, %rax    # clear out rax

### End function

	ret

	

	
