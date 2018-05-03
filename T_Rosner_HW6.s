;Author: Tanner Rosner
;Class: Comp Org 2 Prof. Lakhani
;
;Objective: Count how many 'T' characters 
;Are in the string that is given under the
;"String" memory
;
; R2- Num of T's in String
; R3- Memory location of "String"
; R4- Memory location of "Char" and also location of "Zero"
; R5- Byte from "String"
; R6- Byte from "Char"
; R7- Placeholder for value "0"
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.equ  PrChr, 0x00               ; Display character on stdout
.equ Exit, 0x11			; Halt Execution
.equ PrStr, 0x69    	        ; Write string to a file or stdout
.equ PrInt, 0x6b                ; Write integer to a file or stdout


.data
String: .asciz "This is my string"
Char: .asciz "T"
Message: .asciz "Number of T's in String: "

.text

LDR R3, =String			;Loads memory location "String" value into R3
LDR R4, =Char			;Loads memory location "Char" into R4
LDRB R6, [R4]			;Grabs the T character from memory location "Char"
Mov R7, #0			;Loads zero to compare to the "String" byte later on


Loop:

LDRB R5, [R3]			;Grabs Byte from "String" and places it into R5
CMP R5, R7			;Compare "String" byte to "Zero". If zero then it is null (end of string)
BEQ print
CMP R5, R6			;Compare "String" byte to "Char" byte
BNE notEqual			
Add R2, R2, #1			;If equal than increment 'T' counter by 1

notEqual:
Add R3, R3, #1			;Points to next byte in "String"
B Loop

print:

Mov R0, #1
LDR R1, =Message
SWI PrStr
Mov R1, R2
SWI PrInt
Mov R0, #'\n'			;Add a new line character after displaying integer to stdout
SWI PrChr






end: SWI Exit


