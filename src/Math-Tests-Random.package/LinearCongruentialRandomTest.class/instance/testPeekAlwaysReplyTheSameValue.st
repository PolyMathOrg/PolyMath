tests
testPeekAlwaysReplyTheSameValue
	| g |
	g := PMLinearCongruentialRandomGenerator new.
	self assert: g peek equals: g peek