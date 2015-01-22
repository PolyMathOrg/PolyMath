tests
testMultiplyByI
	
	| c |
	c := (5 - 6 i).
	self assert: (c * 1i = c i)