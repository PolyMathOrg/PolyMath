information
negativeMachinePrecision
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 22/4/99 "
	negativeMachinePrecision isNil
		ifTrue: [ self computeNegativeMachinePrecision].
	^negativeMachinePrecision