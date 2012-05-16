information
slope
		"Answers the slope of the receiver
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "
	slope isNil
		ifTrue: [ self computeResults].
	^slope