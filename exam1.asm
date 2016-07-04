;Prelim Examination in ICST105 - Computer Organization and Machine Language
;Copyright (c) 2016. Wolf Syntax
;Jayson D. Alpe (Wolf Syntax)
;BSIT - 3
;Ateneo de Naga University

TITLE 	exam1.asm
.model	small
.stack 100H
.data
	msg1	DB	'Type the 4-digit year: $'
	msg2	DB 	'Reverse : $'
	reverse	DB 	5,?,5 DUP('$')
	year	DB 	5,?,5 DUP('$')
	
.code

	;int main(){
	MAIN PROC
		
		MOV AX, @data
		MOV DS, AX
		
		;cout << 'Type the 4-digit year: $'
		MOV AH, 09H
		LEA DX, msg1
		INT 21H
		
		;cin >> year
		MOV AH, 3FH
		MOV DX, OFFSET year
		INT 21H
		
		;Reverse YEAR
		MOV DL, year[0]
		MOV reverse[4], DL

		MOV DL, year[1]
		MOV reverse[3], DL

		MOV DL, year[2]
		MOV reverse[2], DL

		MOV DL, year[3]
		MOV reverse[1], DL
		
		;cout << 'Reverse : '	
		MOV AH, 09H
		MOV DX, OFFSET msg2
		INT 21H

		;cout << reverse
		MOV AH, 09H
		MOV CX, 4
		LEA DX, reverse+1
		INT 21H

		;return 0
		MOV AH, 4CH
		INT 21H
		
	ENDP MAIN
	END MAIN
	;}
