printing
printOn: aStream
	"Append to the argument aStream, a sequence of characters that describes the receiver."
	| delimitingString n k |
	n := rows size.
	rows 
		do:
			[ :row |
			  delimitingString := '('.
			  k := 0.
			  row do:
				[ :each |
					aStream nextPutAll: delimitingString.
					each printOn: aStream.
					k := k + 1.
					delimitingString := k < n ifTrue: [ ' '] ifFalse: [ ' : '].
				].
		 	aStream nextPut: $).]
		separatedBy: [ aStream cr]
	