TITLE alpe5.asm
.model	small
.stack	100H
.data
	msg 		DB 		10,13,'Input a string: $'
	num			DB		?
	prompt		DB		'How many times do you want to display the string: $'

	p_len		DB		51
	p_alen		DB		?
	p_msg		DB		51 DUP('$')

	newline		DB		10,13,'$'
.code
	MAIN PROC

		MOV AX, @data
		MOV DS, AX

			MOV AH, 09H
			LEA DX, msg
			INT 21H

			MOV AH, 0AH
			LEA DX, p_msg
			INT 21H

			MOV AH, 09H
			LEA DX, newline
			INT 21H

			MOV AH, 09H
			LEA DX, prompt
			INT 21H

			MOV AH, 01H
			INT 21H

			SUB AL, 30H
			
			MOV CL, AL
			
				MOV AH, 09H
			LEA DX, newline
			INT 21H

		show:	

			MOV AH, 09H
			LEA DX, p_msg+2	
			INT 21H

			MOV AH, 09H
			LEA DX, newline
			INT 21H

		loop show
		MOV AH, 4CH
		INT 21H

	ENDP MAIN
	END MAIN
