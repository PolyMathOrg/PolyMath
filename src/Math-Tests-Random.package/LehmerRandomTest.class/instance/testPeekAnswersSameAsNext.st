tests
testPeekAnswersSameAsNext
	| g |
	g := LehmerRandom new.
	self assert: g peek = g next