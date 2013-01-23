tests
testPeekAnswersSameAsNext
	| g |
	g := LCRandom new.
	self assert: g peek = g next