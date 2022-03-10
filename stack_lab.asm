;=================================================
; Name: Zachary Green
; Email: zgree004@ucr.edu
; 
; Lab: lab 6, ex 1
; Lab section: 024
; TA: James Luo
; 
;=================================================
.orig x3000

;----------------
; Instructions
;----------------
; Initialize the Stack
LD R6, STACK_ADDR

;this stack lab computes the polish notation of a set of calls

;push_val(4) pushes the value 4 onto the stack [4]
LD R1, VALUE_4          ; R1 <-- x4 (represents #4)
LD R5, push_val_ADDR    ; R5 <-- x3400 (address of the push_val subroutine)
JSRR R5                 ; Jump to the subroutine at the memory address stored in R6 (push_val)

;push_val(3) pushes the value 3 onto the stack [4,3]
LD R1, VALUE_3          ; R1 <-- x3 (represents #3)
LD R5, push_val_ADDR    ; R5 <-- x3400 (address of the push_val subroutine)
JSRR R5                 ; Jump to the subroutine at the memory address stored in R6 (push_val)

;push_val(2) pushes the value 2 onto the stack [4,3,2]
LD R1, VALUE_2          ; R1 <-- x2 (represents #2)
LD R5, push_val_ADDR    ; R5 <-- x3400 (address of the push_val subroutine)
JSRR R5                 ; Jump to the subroutine at the memory address stored in R6 (push_val)

;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD R5, add_val_ADDR     ; R5 <-- x3800 (address of the add_val subroutine)
JSRR R5                 ; Jump to the subroutine at the memory address stored in R6 (add_val)

;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
LD R5, add_val_ADDR     ; R5 <-- x3800 (address of the add_val subroutine)
JSRR R5                 ; Jump to the subroutine at the memory address stored in R6 (add_val)

;move the top value of the stack into r4

HALT                      ; Halt program(like exit() in C++)
;---------------------------------------------------------------------------------
; Required labels/addresses
;---------------------------------------------------------------------------------

; Stack Address 
STACK_ADDR            .FILL    xFE00

; Addresses of Subroutines
push_val_ADDR         .FILL    x3400
add_val_ADDR          .FILL    x3800

; Local data
  
VALUE_4               .FILL x4     ; Put x4 into memory here (represents #4)
VALUE_3               .FILL x3     ; Put x3 into memory here (represents #3)
VALUE_2               .FILL x2     ; Put x2 into memory here (represents #2)

.end

;------------------------------------------------------------------------
; Subroutine: push_val
; Parameter (R1): The value to be pushed to the top of the stack
; Postcondition: The subroutine has pushed a value (passed as a parameter in R1)
;                to the top of the stack.
; Return Value: No return value, no output, but R1 still contains the value
;               to be pushed to the top of the stack, unchanged
;-------------------------------------------------------------------------
.orig x3400 ;;push_val(int val) implement your push function that will push a value onto the stack

; subroutine instructions:


; subroutine algorithm:

ADD R6, R6, #-1

STR R1, R6, x0              ; Mem[ (R6) + (x0) ] <-- R1
    

; (4) Return: 

RET

; Local data for subroutine push_val

HALT

;------------------------------------------------------------------------
;                             END SUBROUTINE
;------------------------------------------------------------------------

.end                ; NOTE: just ONE .end for the whole file

;------------------------------------------------------------------------
; Subroutine: add_val
; Parameter (R): No parameter
; Postcondition: The subroutine has popped the two top values off of the stack,
;                then added them together, pushing the sum onto the stack. The
;                top value on the stack is stored in R4.
; Return Value (R4): The top value on the stack
;-------------------------------------------------------------------------
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack

; subroutine algorithm:

LDR R2, R6, x0          ; R2 <-- Mem[ (R6) + (#0) ]

ADD R6, R6, #1

LDR R3, R6, x0          ; R3 <-- Mem[ (R6) + (#0) ]

ADD R6, R6, #1          

AND R4, R4, x0          ; Resetting the contents of R4 to x0 (represents #0)
ADD R4, R2, R3          ; R4 <-- (R2) + (R3)

ADD R6, R6, #-1
STR R4, R6, x0          ; Mem[ (R4) + (x0) ] <-- R1

; (4) Return: 

RET

; Local data for subroutine add_val

HALT

;------------------------------------------------------------------------
;                             END SUBROUTINE
;------------------------------------------------------------------------

.end                ; NOTE: just ONE .end for the whole file

.orig x4200 ;;data you might need

.end