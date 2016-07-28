TITLE alpe7.asm

.MODEL		SMALL
.STACK		100H
.DATA

	msg1	DB		10,13, 'Type a number: $'
	msg2	DB		10,13, 'Type a character: $'
	msg3	DB		10,13, 'Create a Square: $'
	
	ui1		DW		?
	ui2		DW		?
	ui3		DB		?
	
	newline	DB		10,13,'$'
	
.CODE

	MAIN PROC 
	
		MOV AX, @data
		MOV DS, AX
			
			MOV AH, 09H
			LEA DX, msg1
			INT 21H
			
			MOV AH, 01H
			INT 21H
			
			SUB AL, 30H
			
			CBW
			MOV CX, AX
			
			MOV ui1, AX
			MOV ui2, AX
			
			MOV AH, 09H
			LEA DX, msg2
			INT 21H
			
			MOV AH, 01H
			INT 21H
			
			MOV ui3, AL
		
			MOV AH, 09H
			LEA DX, newline
			INT 21H
		
			MOV CX, ui1
		
		outer_loop:
			
			MOV ui1, CX
			MOV CX, ui2
			
			inner_loop:
			
				MOV AH, 02H
				MOV DL, ui3
				INT 21H
			
			loop inner_loop
			
			MOV AH, 09H
			LEA DX, newline
			INT 21H
			
			MOV CX, ui1
			
		loop outer_loop
		
		MOV AH, 4CH
		INT 21H
	
	ENDP MAIN
	END MAIN
