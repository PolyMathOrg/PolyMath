information
precisionOf: aNumber1 relativeTo: aNumber2
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 3/5/99 "
	^aNumber2 > DhbFloatingPointMachine new defaultNumericalPrecision
		ifTrue: [ aNumber1 / aNumber2]
		ifFalse:[ aNumber1]