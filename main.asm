INCLUDE Irvine32.inc

.data
	prompt BYTE "Enter two values: ", 0
	prompt2 BYTE "Choose an option: ",0
	option1 BYTE "1. x AND y", 0
	option2 BYTE "2. x OR y", 0
	option3 BYTE "3. NOT x", 0
	option4 BYTE "4. x XOR y", 0
	option5 BYTE "5. Exit program", 0
	operName1 BYTE "Performing x AND y" ,0
	operName2 BYTE "Performing x OR y" ,0
	operName3 BYTE "Performing NOT x" ,0
	operName4 BYTE "Performing x XOR y" ,0
	operName5 BYTE "Exiting program" ,0
	intNum1 DWORD ?
	intNum2 DWORD ?
	intOption DWORD ?
.code
main PROC

	;TODO: prompt user to enter two values
	;If the user�s entry is invalid, output an error message
	;repeat the previous process as long as the user will enter an invalid number. 
	
	MOV edx,OFFSET prompt
	CALL writestring
	CALL Crlf
	CALL readint
	MOV intNum1, eax
	CALL readint
	MOV intNum2,eax
	CALL Crlf

	;display option strings
	MOV edx, OFFSET option1
	CALL writestring
	CALL Crlf
	MOV edx, OFFSET option2
	CALL writestring
	CALL Crlf
	MOV edx, OFFSET option3
	CALL writestring
	CALL Crlf
	MOV edx, OFFSET option4
	CALL writestring
	CALL Crlf
	MOV edx, OFFSET option5
	CALL writestring
	CALL Crlf

	
	;display message and store user option input
	MOV edx,OFFSET prompt2
	CALL writestring
	CALL readint
	MOV intOption, eax

	.IF (intOption > 0) && (intOption < 6)
		;displaying operation performed and result
		.IF intOption == 1
			MOV edx,OFFSET operName1
			CALL writestring
			CALL Crlf
			MOV eax,intNum1
			AND eax,intNum2
			CALL writedec
			CALL Crlf
			CALL writehex
		.ELSEIF intOption == 2
			MOV edx,OFFSET operName2
			CALL writestring
			CALL Crlf
			MOV eax,intNum1
			OR eax,intNum2
			CALL writedec
			CALL Crlf
			CALL writehex
		.ELSEIF intOption == 3
			MOV edx,OFFSET operName3
			CALL writestring
			CALL Crlf
			MOV eax,intNum1
			NOT eax
			CALL writedec
			CALL Crlf
			CALL writehex
		.ELSEIF intOption == 4
			MOV edx,OFFSET operName4
			CALL writestring
			CALL Crlf
			MOV eax,intNum1
			OR eax,intNum2
			NOT eax
			CALL writedec
			CALL Crlf
			CALL writehex
		.ELSEIF intOption == 5
		.ENDIF
	.ENDIF
	;When the user makes a valid entry, display the name of the operation about to be performed. 
	;The values entered and the result after performing the operation

main ENDP
END main