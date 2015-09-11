printing
printOn: aStream
	super printOn: aStream .
	aStream nextPut: $(.
	block printOn: aStream .
	aStream nextPutAll: ' value: ' .
	result printOn: aStream.
	aStream nextPut: $).