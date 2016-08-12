TITLE alpe10.asm
.MODEL				small
.STACK				100H
.DATA

	multiplier		DB		-5
	mulp 			DB		?
	inp				DB		?
	bitz			DB		?
	sbit			DB		?
	prompt1			DB		10,13,'Type a number to be multiplied to -5: $'
	prompt2			DB		10,13,'Type (+) or (-) for number',27H,'s sign: $'
	result1			DB		'Positive$'
	result2			DB		'Negative$'
	newline			DB		10,13,'$'
	prompt_result	DB		10,13, 'Resulting sign: $'
	neg1			DB		-1
	pos1			DB		1
.CODE

	MAIN PROC

		MOV AX, @data
		MOV DS, AX

			MOV AH, 09H
			LEA DX, prompt1
			INT 21H

			MOV AH, 01H
			INT 21H

			SUB AL, 30H
			MOV inp, AL
			
			MOV AH, 09H
			LEA DX, prompt2
			INT 21H

			MOV AH, 01H
			INT 21H

			MOV sbit, AL

			MOV AL, inp

			CMP sbit, '+'
			JE positive

			CMP sbit, '-'
			JE negative

		negative:

			IMUL neg1

		positive:

		
	closed:
		MOV AH, 4CH
		INT 21H

	ENDP MAIN
	END MAIN 
