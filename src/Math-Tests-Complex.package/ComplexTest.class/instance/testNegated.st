tests
testNegated
	"self run: #testNegated"
	"self debug: #testNegated"
	
	| c |
	c := (2 + 5 i) .
	self assert: c negated  = (-2 - 5i).
	