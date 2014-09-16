printing
printOn: aStream
	super printOn: aStream.  
	aStream nextPutAll: ' for '.
	result printOn: aStream .
	aStream nextPutAll: ' with data of size: '; print: dataHolder size.