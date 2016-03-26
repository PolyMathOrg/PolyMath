tests
testOne
	| one |
	one := Complex one.
	self assert: one isComplexNumber.
	self assert: one real equals: 1.
	self assert: one imaginary equals: 0