display
printOn: aStream 
	"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 05-Jan-00 "

	position printOn: aStream.
	aStream
		nextPut: $:;
		space.
	value printOn: aStream