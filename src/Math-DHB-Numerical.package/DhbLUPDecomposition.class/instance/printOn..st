display
printOn: aStream
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 30/3/99 "
	| first delimitingString n k |
	n := rows size.
	first := true.
	rows do:
		[ :row |
		  first ifTrue: [ first := false]
				 ifFalse:[ aStream cr].
		  delimitingString := '('.
		  row do:
			[ :each |
				aStream nextPutAll: delimitingString.
				each printOn: aStream.
				delimitingString := ' '.
			].
		  aStream nextPut: $).
		].