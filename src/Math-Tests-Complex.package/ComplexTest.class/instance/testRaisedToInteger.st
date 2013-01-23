tests
testRaisedToInteger
	
	| c c3 |
	c := (5 - 6 i).
	c3 := (c * c * c).
	self assert: (c3 = (c raisedToInteger: 3)).
	self assert: (c3 reciprocal = (c raisedToInteger: -3)).