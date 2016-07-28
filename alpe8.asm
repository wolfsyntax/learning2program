TITLE alpe8.asm
.model			small
.stack			100H
.data

	msg1		DB		10,13,'Type a digit between 0-9: $'
	ui1			DB		?
	ui2			DB		?
	prompt1		DB		10,13,'Output : $'
	
	prompt2		DB		10,13,'Again? (Y/N): $'
	newline		DB		10,13,'$'
	prompt3		DB		10,13,'Input Error!$'
	prompt4		DB		10,13,'Error! Type Y or N only.$'
	
	
.code

	MAIN PROC
		
		MOV AX, @data
		MOV DS, AX
				
		outer_loop:
		
			LEA DX, msg1
			MOV AH, 09H
			INT 21H

			MOV AH, 01H
			INT 21H
			
			JMP check
			
			inner_loop:
			
				MOV AH, 02H
				MOV DL, ui2
				INT 21H
				
				
			loop inner_loop
			
			JMP ask
		
		ask:
		
			LEA DX, prompt2
			MOV AH, 09H
			INT 21H
			
			MOV AH, 01H
			INT 21H
			
			CMP AL, 'Y'
			JE outer_loop
			
			CMP AL, 'y'
			JE outer_loop
			
			CMP AL, 'N'
			JE closed
			
			CMP AL, 'n'
			JE closed
						
			CMP AL, 'Y'
			JNE wrong1
			
			CMP AL, 'y'
			JNE wrong1
			
			CMP AL, 'N'
			JNE closed
			
			CMP AL, 'n'
			JNE closed
			
		loop outer_loop
	
	closed:
		
		MOV AH, 4CH
		INT 21H
	
	wrong1:
	
		MOV AH, 09H
		LEA DX, prompt4
		INT 21H
		
		MOV AH, 09H
		LEA DX, newline
		INT 21H

		JMP ask	
	
	wrong2:
	
		MOV AH, 09H
		LEA DX, prompt3
		INT 21H
		
		MOV AH, 09H
		LEA DX, newline
		INT 21H

		JMP outer_loop
	
	check:
	
		CMP AL, '0'
		JE store

		CMP AL, '1'
		JE store

		CMP AL, '2'
		JE store

		CMP AL, '3'
		JE store

		CMP AL, '4'
		JE store

		CMP AL, '5'
		JE store

		CMP AL, '6'
		JE store

		CMP AL, '7'
		JE store

		CMP AL, '8'
		JE store

		CMP AL, '9'
		JE store
		
		JMP wrong2
	
	store:	
		
		MOV ui2, AL

		SUB AL, 30H

		MOV ui1, AL
		CBW
		MOV CX, AX
			
		MOV AH, 09H
		LEA DX, prompt1
		INT 21H	
			
		JMP inner_loop
		
	ENDP MAIN
	END MAIN
