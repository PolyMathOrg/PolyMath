initialization
setNegativeX: aNumber
	( functionBlock value: aNumber) < 0
		ifFalse:[ self error: 'Function is not negative at x = ', aNumber printString].
	negativeX := aNumber