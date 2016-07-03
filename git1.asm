;Exercise 1 in ICST105 - Computer Organization and Machine Language (Assembly : TASM)
;Copyright (c) 2016. Wolf Syntax (Jayson Alpe)
;July 3, 2016

TITLE git1.asm
.model  small
.stack 100H
.data
    welcome   DB    'Welcome to learning2program', 10, 13, '$'
    prompt1   DB    'Enter your first name: ','$'
    prompt2   DB    'Enter you last name: ','$'
    prompt3   DB    'Enter your birth year: ','$'
    
    fname     DB    55, ?, 55 DUP('$')
    fn        EQU   $ - fname
    
    lname     DB    55, ?, 55 DUP('$')
    ln        EQU   $ - lname
    
    byear     DB    5, ?, 5 DUP('?')
    bn        EQU   $ - byear
    
    
    newline   DB    0DH,0AH,'$'
    terminate DB    '$'
    
.code
    MAIN PROC
      MOV AX, @data
      MOV DS, AX
      
      MOV AH, 09H
      MOV DX, OFFSET welcome
      INT 21H
      
      MOV AH, 09H
      LEA DX, newline
      INT 21H     
      
      MOV AH, 09H
      MOV DX, OFFSET prompt1
      INT 21H
      
      MOV AH, 3FH
      LEA DX, fname
      INT 21H
      
      MOV AH, 09H
      LEA DX, newline
      INT 21H
      
      MOV AH, 09H
      MOV DX, OFFSET prompt2
      INT 21H
      
      MOV AH, 3FH
      LEA DX, lname
      INT 21H
      
      MOV AH, 09H
      MOV DX, OFFSET newline
      INT 21H
      
      MOV AH, 09H
      MOV DX, OFFSET prompt3
      INT 21H
      
      MOV AH, 0AH
      LEA DX, byear
      INT 21H

      MOV AH, 09H
      MOV DX, OFFSET newline
      INT 21H
      	  
;DISPLAY:
	  
      MOV AH, 40H
      MOV BH, 00H
      MOV CX, 3
      MOV DX, OFFSET fname
      INT 21H
      
      MOV AH, 2H
      MOV DL, '_'
      INT 21H
      
      MOV AH, 40H
      MOV BH, 00H
      MOV CX, 4
      MOV DX, OFFSET lname
      INT 21H
	  
	  
      MOV AH, 09H
      MOV CX, 2
      LEA DX, byear+4
      INT 21H
;Exit:
      ;Return 0
      MOV AH, 4CH
      INT 21H

    ENDP MAIN
END MAIN
