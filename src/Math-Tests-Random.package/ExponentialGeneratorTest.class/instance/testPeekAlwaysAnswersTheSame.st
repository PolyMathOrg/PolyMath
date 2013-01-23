tests-as yet unclassified
testPeekAlwaysAnswersTheSame
	| eg |
	eg := ExponentialGenerator new.
	self should: [eg peek = eg peek].
	self should: [eg peek = eg next].