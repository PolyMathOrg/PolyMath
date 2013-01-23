tests
testBinomialGeneratorWithSuccessProbabilityOfZeroAlwaysReturnZero
	| g numberOfTrials |
	g := BinomialGenerator new.
	numberOfTrials := 10.
	g
		n: numberOfTrials;
		p: 0.0.
	g generator: LCRandom new.
	self assert: g next = 0.
	g generator: LehmerRandom new.
	self assert: g next = 0.
	g generator: MersenneTwisterRandom new.
	self assert: g next = 0