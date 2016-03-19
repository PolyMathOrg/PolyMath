printing
printOn: aStream
	super printOn: aStream .
	aStream nextPutAll: '(box: ' .
	result printOn: aStream .
	aStream nextPutAll: ' constraints: ' .
	constraints printOn: aStream.
	aStream nextPut: $).