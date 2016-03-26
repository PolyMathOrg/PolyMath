display
printOn: aStream
		"Append to the argument aStream, a sequence of characters that describes the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/6/99 "
	| first |
	first := true.
	lowerRows do: 
		[ :each |
		  first ifTrue: [ first := false]
				 ifFalse:[ aStream cr].
		  each printOn: aStream.
		].