tests
testPeekAlwaysAnswersTheSame
	| eg |
	eg := PMExponentialGenerator new.
	self assert: eg peek equals: eg peek.
	self assert: eg peek equals: eg next