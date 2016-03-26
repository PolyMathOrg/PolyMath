tests
testFloatClass
	"just make sure it's implemented"

	self assert: ((1 + 3.4 i) imaginary isKindOf: 1 i floatClass).
	self assert: (1.01 asComplex real isKindOf: 1.01 class)