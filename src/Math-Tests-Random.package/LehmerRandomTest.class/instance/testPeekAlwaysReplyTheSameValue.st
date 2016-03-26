tests
testPeekAlwaysReplyTheSameValue
	| g |
	g := LehmerRandom new.
	self assert: g peek equals: g peek