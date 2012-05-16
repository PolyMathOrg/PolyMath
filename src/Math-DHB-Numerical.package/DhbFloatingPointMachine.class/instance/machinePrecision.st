information
machinePrecision
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 22/4/99 "
	machinePrecision isNil
		ifTrue: [ self computeMachinePrecision].
	^machinePrecision