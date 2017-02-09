display
printOn: aStream
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/4/99 "
	super printOn: aStream.
	aStream nextPut: $[;
			nextPutAll: probabilityDensityFunction class distributionName;
			nextPut: $].