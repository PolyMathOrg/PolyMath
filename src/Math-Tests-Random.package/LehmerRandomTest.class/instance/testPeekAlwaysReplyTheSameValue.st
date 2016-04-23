tests
testPeekAlwaysReplyTheSameValue
	| g |
	g := PMLehmerRandomGenerator new.
	self assert: g peek equals: g peek