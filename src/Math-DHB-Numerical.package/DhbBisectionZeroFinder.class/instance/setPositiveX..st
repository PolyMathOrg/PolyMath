initialization
setPositiveX: aNumber
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 22/4/99 "
	( functionBlock value: aNumber) > 0
		ifFalse:[ self error: 'Function is not positive at x = ', aNumber printString].
	positiveX := aNumber.