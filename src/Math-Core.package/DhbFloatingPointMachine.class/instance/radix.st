information
radix
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 21/4/99 "
	radix isNil
		ifTrue: [ self computeRadix].
	^radix