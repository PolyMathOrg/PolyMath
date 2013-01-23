tests
testSquared
	"self run: #testSquared"
	"self debug: #testSquared"
	
	| c c2 |
	c := (6 - 6 i).
	c2 := (c squared).
	self assert: c2 imaginary = -72.
	self assert: c2 real = 0.