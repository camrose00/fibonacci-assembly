	.syntax unified
	.cpu cortex-m4
	.bss
// Write code here for the data words in the .bss section
// to be initialized to zero
	first: .word 0
	second: .word 0
	state: .word 0
	.text
	.global 	init_fibonacci
	.thumb_func
	.align

init_fibonacci:
LDR R2, =first
MOV R3, 0
STR R3, [R2]
LDR R0, =second
MOV R1, 1
STR R1, [R0]
		bx lr
		
		.global fibonacci
		.thumb_func
		.align
fibonacci:
LDR R1,=state
LDR R2, [R1]
CMP R2, 2
MOV R0, R2
ADD R2,1
STR R2, [R1]
blo nota
LDR R1, =first
LDR R2, [R1]
LDR R3, =second
LDR R0, [R3]
STR R0, [R1]
ADD R0, R2
CMP R0, R2
ITE LO
LDRLO R0, =0xFFFFFFFF
STRHS R0, [R3]
nota:
	bx lr
	.end
