tests
testOne
	| one |
	one := Complex one.
	self assert: one isComplex.
	self assert: one real = 1.
	self assert: one imaginary = 0.