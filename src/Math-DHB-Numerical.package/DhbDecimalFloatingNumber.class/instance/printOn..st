display
printOn: aStream
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 9/6/99 "
	mantissa printOn: aStream.
	aStream nextPutAll: 'xE'.
	exponent negated printOn: aStream.