information
intercept
		"Answers the intercept of the receiver
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "
	intercept isNil
		ifTrue: [ self computeResults].
	^intercept