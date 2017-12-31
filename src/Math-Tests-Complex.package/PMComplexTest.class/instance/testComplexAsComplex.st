tests
testComplexAsComplex
	| ineg |
	ineg := -1 i.
	self assert: ineg asComplex == ineg.