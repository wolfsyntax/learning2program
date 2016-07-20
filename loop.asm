TITLE loop.asm
.model			small
.stack			100H
.data
	msg			DB		10,13,'Do you want to repeat? (Y/N): $'
	bye			DB		10,13,'Good Bye!$'
	error		DB		10,13,'Invalid input!$'
.code
	MAIN PROC

		MOV AX, @data
		MOV DS, AX
question:
			MOV AH, 09H
			LEA DX, msg
			INT 21H

			MOV AH, 01H
			INT 21H

			CMP AL, 'Y'
			JE	question

			CMP AL, 'y'
			JE question

			CMP AL, 'N'
			JE exit

			CMP AL, 'n'
			JE exit

			MOV AH, 09H
			LEA DX, error
			INT 21H

			jmp	question
exit:			

			MOV AH, 09H
			LEA DX, bye
			INT 21H

		MOV AH, 4CH
		INT 21H

	ENDP MAIN
	END MAIN
