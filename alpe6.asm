TITLE alpe6.asm
.model small
.stack 100H
.data

	msg1 	DB		'Type 5 numbers$'
	msg2	DB		10,13,'Type a number:$'
	msg3	DB		10,13,'Error! Input is not a number$'
	msg4	DB 		'The numbers entered are: $'

	num1 	DB		?
	newline	DB		10,13,'$'
	input	DB		?,' ',?,' ',?,' ',?,' ',?,'$'

.code
	
	MAIN PROC

		MOV AX, @data
		MOV DS, AX

			MOV AH, 09H
			LEA DX, msg1
			INT 21H

			MOV CX, 5
			MOV SI, 0

			repeat:
				MOV AH, 09H
				LEA DX, msg2
				INT 21H

				MOV AH, 01H
				INT 21H 

				;SUB AL, 30H

				CMP AL, 30H
				JL  mistake
				
				CMP AL, 40H
				JG	mistake

				CMP AL, 30H
				JMP passed

				CMP AL, 31H
				JMP passed

				CMP AL, 32H
				JMP passed

				CMP AL, 33H
				JMP passed

				CMP AL, 34H
				JMP passed

				CMP AL, 35H
				JMP passed

				CMP AL, 36H
				JMP passed

				CMP AL, 37H
				JMP passed

				CMP AL, 38H
				JMP passed

				CMP AL, 39H
				JMP passed

				CMP AL, 40H
				JMP passed

			passed:

				MOV input+SI, AL
				INC SI
				INC SI


				loop repeat
				


				MOV AH, 09H
				LEA DX, newline
				INT 21H

				MOV AH, 09H
				LEA DX, msg4
				INT 21H

				MOV AH, 09H
				LEA DX, input
				MOV CX, 5
				INT 21H

			mistake:

				MOV AH, 09H
				LEA DX, msg3
				INT 21H
			
			
		MOV AH, 4CH
		INT 21H

	ENDP MAIN
	END MAIN
