running
testFloatClass
	"not much to do here?"

	self assert: (1.5 isKindOf: (1.5 * q1234) floatClass).
	self assert: q12 floatClass equals: q12 reduce floatClass