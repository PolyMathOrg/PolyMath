tests
testPeekAnswersSameAsNext
	| g |
	g := LCRandom new.
	self assert: g peek equals: g next