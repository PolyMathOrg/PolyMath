printing
printOn1: aStream
	aStream
		nextPutAll: self class name;
		nextPutAll: '( function: ';
		nextPutAll: originalFunction asString