
;Searching value in a list or table using XLAT

;Codesnippet. ICST105. ADNU (c) 2016. 

;Jayson D. Alpe | Wolf Syntax
;BSIT-3
;Ateneo de Naga University


TITLE lookup.asm

.model		small
.stack		100H
.data
	
	tbl			DB		1, 5, 10, 20, 50
	prompt		DB		'Type a number between 1 to 5: $'
	query		DB		'Number: $'
	num			DB		?
	result		DB		?,?,'$'
	ten			DB 		10
	newline		DB		0DH, 0AH, '$'
.code

	MAIN PROC
		
		;Setup Data Segment
		MOV AX, @data
		MOV DS, AX
			;Type a number between 1 to 5:
			MOV AH, 09H
			MOV DX, OFFSET prompt
			INT 21H
			
			;user input
			MOV AH, 01H
			INT 21H
			
			SUB AL, 30H			;convert value from ASCII
			DEC AL				;value--
			MOV num, AL			;num = value
			
			;cout << endl
			MOV AH, 09H		
			MOV DX, OFFSET newline
			INT 21H
			
			;look-up [table | list]
			LEA BX, tbl				;LEA BX, table_name
			MOV AH, OFFSET num		;MOV AH, location
			XLAT					;AX = value in Location
			CBW						;convert byte to word = [AL -> AH]
			;or MOV AH, 00H

			;AX = AX/10
			DIV ten
			
			;convert each digit into ASCII character
			ADD AL, 30H
			ADD AH, 30H
			
			;Byte size operand [4bits]
			;AL = quotient, AH = remainder
			MOV result, AL
			MOV result+1, AH	
			
			;Number:
			MOV AH, 09H
			LEA DX, query
			INT 21H
			
			;Display the result
			MOV AH, 09H
			MOV DX, OFFSET result
			INT 21H
		
		;return 0
		MOV AH, 4CH
		INT 21H
		
	ENDP MAIN
	END MAIN
