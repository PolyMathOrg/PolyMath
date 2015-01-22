tests
testReciprocal
	"self run: #testReciprocal"
	"self debug: #testReciprocal"
	
	| c |
	c := (2 + 5 i).
	self assert: c reciprocal  = ((2/29) - (5/29)i).
	