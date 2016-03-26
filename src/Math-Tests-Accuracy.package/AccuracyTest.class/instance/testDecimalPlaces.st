tests
testDecimalPlaces
	self assert: a class decimalPlaces equals: 3.
	a class decimalPlaces: 2.
	self assert: a class decimalPlaces equals: 2