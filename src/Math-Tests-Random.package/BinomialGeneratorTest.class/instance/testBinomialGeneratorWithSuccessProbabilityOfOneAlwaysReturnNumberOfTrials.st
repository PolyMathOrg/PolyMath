tests
testBinomialGeneratorWithSuccessProbabilityOfOneAlwaysReturnNumberOfTrials
	| g numberOfTrials |
	g := PMBinomialGenerator new.
	numberOfTrials := 10.
	g
		numberOfTrials: numberOfTrials;
		probability: 1.0.
	g generator: PMLinearCongruentialRandomGenerator new.
	self assert: g next equals: numberOfTrials.
	g generator: PMLehmerRandomGenerator new.
	self assert: g next equals: numberOfTrials.
	g generator: PMMersenneTwisterRandomGenerator new.
	self assert: g next equals: numberOfTrials