tests-as yet unclassified
testPeekAlwaysAnswersTheSame
	| eg |
	eg := ExponentialGenerator new.
	self assert: eg peek equals: eg peek.
	self assert: eg peek equals: eg next