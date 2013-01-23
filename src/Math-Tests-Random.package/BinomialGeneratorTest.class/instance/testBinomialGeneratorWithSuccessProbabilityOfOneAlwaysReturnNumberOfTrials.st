tests
testBinomialGeneratorWithSuccessProbabilityOfOneAlwaysReturnNumberOfTrials
	| g numberOfTrials |
	g := BinomialGenerator new.
	numberOfTrials := 10.
	g
		n: numberOfTrials;
		p: 1.0.
	g generator: LCRandom new.
	self assert: g next = numberOfTrials.
	g generator: LehmerRandom new.
	self assert: g next = numberOfTrials.
	g generator: MersenneTwisterRandom new.
	self assert: g next = numberOfTrials