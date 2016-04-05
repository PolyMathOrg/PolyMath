initialization
setPositiveX: aNumber
	( functionBlock value: aNumber) > 0
		ifFalse:[ self error: 'Function is not positive at x = ', aNumber printString].
	positiveX := aNumber