tests
testBinomialGeneratorWithSuccessProbabilityOfZeroAlwaysReturnZero
	| g numberOfTrials |
	g := PMBinomialGenerator new.
	numberOfTrials := 10.
	g
		numberOfTrials: numberOfTrials;
		probability: 0.0.
	g generator: PMLinearCongruentialRandomGenerator new.
	self assert: g next equals: 0.
	g generator: PMLehmerRandomGenerator new.
	self assert: g next equals: 0.
	g generator: PMMersenneTwisterRandomGenerator new.
	self assert: g next equals: 0