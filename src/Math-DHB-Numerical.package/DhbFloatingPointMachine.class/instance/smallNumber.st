information
smallNumber
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 5/5/99 "
	smallNumber isNil
		ifTrue: [ smallNumber := self smallestNumber sqrt].
	^smallNumber