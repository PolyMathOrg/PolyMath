tests
testAbs
	"self run: #testAbs"

	"self debug: #testAbs"

	| c |
	c := 6 i: -6.
	self assert: c abs equals: 72 sqrt