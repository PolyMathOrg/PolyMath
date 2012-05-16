operation
computeInitialValues
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 22/4/99 "
	positiveX isNil
		ifTrue: [ self error: 'No positive value supplied'].
	negativeX isNil
		ifTrue: [ self error: 'No negative value supplied'].