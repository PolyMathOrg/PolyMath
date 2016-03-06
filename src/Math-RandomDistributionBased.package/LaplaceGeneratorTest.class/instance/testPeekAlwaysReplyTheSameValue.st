as yet unclassified
testPeekAlwaysReplyTheSameValue
	| g |
	g := self classToTest shape: 0.5 scale: 0.3.
	self assert: g peek = g peek