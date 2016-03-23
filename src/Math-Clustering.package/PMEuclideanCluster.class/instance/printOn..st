printing
printOn: aStream
	
	accumulator count printOn: aStream.
	aStream nextPutAll: ': '.
	center printOn: aStream