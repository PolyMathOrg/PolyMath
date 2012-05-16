display
printOn: aStream
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/16/00 "
	accumulator count printOn: aStream.
	aStream nextPutAll: ': '.
	center printOn: aStream.