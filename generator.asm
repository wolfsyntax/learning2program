TITLE generator.asm
.mdoel  small
.stack 100H
.data
    welcome   DB    'Welcome to learning2program', 10, 13, $'
    prompt1   DB    'Enter your first name: ','$'
    prompt2   DB    'Enter you last name: ','$'
    prompt3   DB    'Enter your birth year: ','$'
    
    fname     DB    55, ?, 55 DUP('$')
    fn        EQU   $ - fname
    
    lname     DB    55, ?, 55 DUP('$')
    ln        EQU   $ - lname
    
    byear     DB    5, ?, 5 DUP('?')
    bn        EQU   $ - byear
    
.code
    MAIN PROC
      MOV AX, @data
      MOV DS, AX
      
      MOV AH, 09H
      MOV DX, OFFSET welcome
      INT 21H
      
      MOV AH, 10H
      LEA DX, fname
      INT 21H
      
      
      
      MOV AH, 4CH
      INT 21H
    ENDP MAIN
