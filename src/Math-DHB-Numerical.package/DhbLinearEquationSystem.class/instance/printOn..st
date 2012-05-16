display
printOn: aStream
		"Append to the argument aStream, a sequence of characters that describes the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "
	| first delimitingString n k |
	n := rows size.
	first := true.
	rows do:
		[ :row |
		  first ifTrue: [ first := false]
				 ifFalse:[ aStream cr].
		  delimitingString := '('.
		  k := 0.
		  row do:
			[ :each |
				aStream nextPutAll: delimitingString.
				each printOn: aStream.
				k := k + 1.
				delimitingString := k < n ifTrue: [ ' '] ifFalse: [ ' : '].
			].
		  aStream nextPut: $).
		].