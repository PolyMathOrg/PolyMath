display
printOn: aStream
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/16/00 "
	super printOn: aStream.
	aStream space.
	count printOn: aStream.
	aStream space.
	average printOn: aStream.