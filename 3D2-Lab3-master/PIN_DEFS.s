	AREA	PIN_DEFS, CODE, READONLY


;IO DEFS
	EXPORT		IO0PIN
	EXPORT		IO0SET
	EXPORT		IO0DIR
	EXPORT		IO0CLR
	EXPORT		IO1PIN
	EXPORT		IO1SET
	EXPORT		IO1DIR
	EXPORT		IO1CLR
IO0PIN 		EQU		0xE0028000
IO0SET		EQU		0xE0028004
IO0DIR		EQU		0xE0028008
IO0CLR		EQU		0xE002800C
IO1PIN 		EQU		0xE0028010
IO1SET		EQU		0xE0028014
IO1DIR		EQU		0xE0028018
IO1CLR		EQU		0xE002801C
	
	
	END