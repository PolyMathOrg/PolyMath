operation
minimizeDirection: aVectorFunction from: aVector 
	"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

	^aVectorFunction
		origin: aVector;
		argumentWith: ( self minimizeDirection: aVectorFunction)