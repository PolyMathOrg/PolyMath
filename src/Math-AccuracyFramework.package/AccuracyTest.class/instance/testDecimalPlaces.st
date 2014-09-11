tests
testDecimalPlaces
	self assert: a class decimalPlaces=3.
	a class decimalPlaces: 2.
	self assert: a class decimalPlaces=2.