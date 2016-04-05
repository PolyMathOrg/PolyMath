display
printOn: aStream 
	position printOn: aStream.
	aStream
		nextPut: $:;
		space.
	value printOn: aStream