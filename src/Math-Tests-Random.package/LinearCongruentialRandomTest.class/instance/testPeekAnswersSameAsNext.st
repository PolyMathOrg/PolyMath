tests
testPeekAnswersSameAsNext
	| g |
	g := PMLinearCongruentialRandomGenerator new.
	self assert: g peek equals: g next