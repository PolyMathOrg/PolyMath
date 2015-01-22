tests
testAdding
	"self run: #testAdding"
	
	| c |
	c := (5 - 6 i) + (-5 + 8 i).     "Complex with Complex"
	self assert: (c =  (0 + 2 i)).