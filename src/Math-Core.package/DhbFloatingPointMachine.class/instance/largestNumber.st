information
largestNumber
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 5/5/99 "
	largestNumber isNil
		ifTrue: [ self computeLargestNumber].
	^largestNumber