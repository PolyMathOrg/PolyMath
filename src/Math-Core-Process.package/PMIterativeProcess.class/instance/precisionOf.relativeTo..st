information
precisionOf: aNumber1 relativeTo: aNumber2
	
	^aNumber2 > DhbFloatingPointMachine new defaultNumericalPrecision
		ifTrue: [ aNumber1 / aNumber2]
		ifFalse:[ aNumber1]