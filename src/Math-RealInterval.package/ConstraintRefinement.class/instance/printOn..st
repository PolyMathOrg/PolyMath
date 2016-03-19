printing
printOn: aStream
	super printOn: aStream .
	aStream nextPutAll: '(box: ' .
	box printOn: aStream .
	aStream nextPutAll: ' constraints: ' .
	constraints printOn: aStream.
	aStream nextPut: $).