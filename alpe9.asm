TITLE alpe9.asm
.MODEL			small
.STACK			100H
.DATA
	
	shour		DB		?
	smin		DB		?
	ssec 		DB		?
	shsec		DB		?
	sfor		DW		?,'$'


	thour		DB		?,?,'$'
	tmin		DB		?,?,'$'
	tsec		DB		?,?,'$'
	thsec		DB		?,?,'$'
	
	ten			DB		10
	twelve		DW		12

	ampm		DB		?,?,'$'

	prompt		DB		10,13,'SYSTEM TIME: $'

.CODE
	
	MAIN PROC

		MOV AX, @data
		MOV DS, AX

			MOV AH, 2CH
			MOV shour, CH 		;hour
			MOV smin, CL		;minutes
			MOV ssec, DH		;seconds
			MOV shsec, DL		;hundredth
			INT 21H


			MOV AL, CH
			CBW
			DIV ten

			CMP AX, 12
			JG p

			CMP AX, 12
			JLE a 

		a:
			MOV ampm, 'A'
			JMP proceed
		p:
			MOV ampm, 'P'

		proceed:
			MOV ampm+1, 'M'
			ADD AL, 30H
			ADD AH, 30H



			MOV thour, AL
			MOV thour+1, AH

			MOV AL, CL
			CBW
			DIV ten

			ADD AL, 30H
			ADD AH, 30H
			MOV tmin, AL
			MOV tmin+1, AH


			MOV AL, DH
			CBW
			DIV ten

			ADD AL, 30H
			ADD AH, 30H

			MOV tsec, AL
			MOV tsec+1, AH

			MOV AL, DL
			CBW
			DIV ten

			ADD AL, 30H
			ADD AH, 30H

			MOV thsec, AL
			MOV thsec+1, AH

			MOV AH, 09H
			LEA DX, prompt
			INT 21H


			MOV AH, 09H
			MOV DX, OFFSET thour 
			INT 21H

			MOV AH, 02H
			MOV DL, ':'
			INT 21H

			MOV AH, 09H
			MOV DX, OFFSET tmin 
			INT 21H

			MOV AH, 02H
			MOV DL, ':'
			INT 21H

			MOV AH, 09H
			MOV DX, OFFSET tsec 
			INT 21H

			MOV AH, 02H
			MOV DL, ':'
			INT 21H

			MOV AH, 09H
			MOV DX, OFFSET thsec 
			INT 21H

			MOV AH, 09H
			LEA DX, ampm
			INT 21H

		MOV AH, 4CH
		INT 21H

	ENDP MAIN
	END MAIN
