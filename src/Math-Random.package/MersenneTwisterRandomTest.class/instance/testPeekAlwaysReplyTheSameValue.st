tests
testPeekAlwaysReplyTheSameValue
	| g |
	g := MersenneTwisterRandom new.
	self assert: g peek = g peek