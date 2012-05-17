tests
testPeekAlwaysReplyTheSameValue
	| g |
	g := LCRandom new.
	self assert: g peek = g peek