tests
testPeekAlwaysReplyTheSameValue
	| g |
	g := LCRandom new.
	self assert: g peek equals: g peek