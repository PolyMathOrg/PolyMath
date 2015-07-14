information
largestExponentArgument
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/18/00 "
	largestExponentArgument isNil
		ifTrue: [ largestExponentArgument := self largestNumber ln].
	^largestExponentArgument