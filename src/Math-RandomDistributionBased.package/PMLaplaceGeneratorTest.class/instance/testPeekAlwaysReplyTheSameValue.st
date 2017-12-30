accessing
testPeekAlwaysReplyTheSameValue
	| g |
	g := self classToTest shape: 0.5 scale: 0.3.
	self assert: g peek equals: g peek