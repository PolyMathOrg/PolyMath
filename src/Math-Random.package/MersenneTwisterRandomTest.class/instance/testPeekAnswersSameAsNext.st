tests
testPeekAnswersSameAsNext
	| g |
	g := MersenneTwisterRandom new.
	self assert: g peek = g next