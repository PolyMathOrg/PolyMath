tests
testPeekAnswersSameAsNext
	| g |
	g := PMLehmerRandomGenerator new.
	self assert: g peek equals: g next