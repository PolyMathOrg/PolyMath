printing
printOn: aStream
	
	| delimitingString |
	rows do:
		[ :row |
		  delimitingString := '('.
		  row do:
			[ :each |
				aStream nextPutAll: delimitingString.
				each printOn: aStream.
				delimitingString := ' ' ].
		  aStream nextPut: $).
		]
		separatedBy: [ aStream cr ]