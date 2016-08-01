TITLE midterm2.asm
.MODEL 				small
.STACK				100H
.DATA

	msg_error 		DB 		10,13, 	'Input Error! Type digits 0-9 only. $'
	msg_prompt		DB		10,13,	'Type the first digit: $'
	msg_output		DB		10,13,	'Output: $'
	indata			DB		'0','1','2','3','4','5','6','7','8','9'
	ten				DB		10
	newline			DB		10,13,'$'
	
.CODE

	MAIN PROC
	
		MOV AX, @data
		MOV DS, AX
	
	ask:
			MOV AH, 09H
			LEA DX, msg_prompt
			INT 21H
			
			MOV AH, 01H
			INT 21H
			
			CMP AL, '0'
			JE show
			
			CMP AL, '1'
			JE show
			
			CMP AL, '2'
			JE show
			
			CMP AL, '3'
			JE show
			
			CMP AL, '4'
			JE show
			
			CMP AL, '5'
			JE show
			
			CMP AL, '6'
			JE show
			
			CMP AL, '7'
			JE show
			
			CMP AL, '8'
			JE show
			
			CMP AL, '9'
			JE show
				
			JMP error_404			;if the user input is not a digit
			
			show:
				
				SUB AL, 30H
				MOV AH, 00H
				MOV SI, AX
				
				SUB ten, AL
				
				MOV AL, ten
				MOV CX, AX
				
				MOV AH, 09H
				LEA DX, newline
				INT 21H
				
			inner_loop:
				
				MOV AH, 02H
				MOV DL, indata[SI]
				INT 21H
				
				MOV AH, 02H
				MOV DL, ' '
				INT 21H
								
				INC SI
				
			loop inner_loop
			JMP closed

	error_404:
			
		MOV AH, 09H
		LEA DX, msg_error
		INT 21H

		JMP ask
			
	closed:
	
		MOV AH, 4CH
		INT 21H
	
	ENDP MAIN
	END MAIN
