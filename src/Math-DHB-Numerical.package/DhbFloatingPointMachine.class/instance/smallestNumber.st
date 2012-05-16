information
smallestNumber
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 5/5/99 "
	smallestNumber isNil
		ifTrue: [ self computeSmallestNumber].
	^smallestNumber