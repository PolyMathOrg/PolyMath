tests
testArg
	"self run: #testArg"
	"self debug: #testArg"
	
	| c |
	c := (0 + 5 i) .
	self assert: c arg  = (Float pi/ 2).
	