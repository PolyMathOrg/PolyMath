display
printOn: aStream
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	self origin printOn: aStream.
	aStream nextPutAll: ' ('.
	self direction printOn: aStream.
	aStream nextPut: $).