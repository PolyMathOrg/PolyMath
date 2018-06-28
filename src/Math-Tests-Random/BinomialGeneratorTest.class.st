Class {
	#name : #BinomialGeneratorTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-Random'
}

{ #category : #tests }
BinomialGeneratorTest >> testBinomialGeneratorConvergesToMean [
	"this test may fail one or more assertions, but its purpose is to verify correct convergence of the binomial distribution, should be Normal (np, np(1-p))"

	| gen nums mean |
	mean := Random new next sqrt.
	gen := PMBinomialGenerator numberOfTrials: 3000 probabilityOfSuccess: mean.
	mean := mean * 3000.
	nums := OrderedCollection new.
	(1 to: 3000) do: [ :ea | nums add: gen next ].
	self assert: nums min > (mean * 0.8).
	self assert: nums max < (mean * 1.2).
	self assert: (nums average - mean) abs < 5
]

{ #category : #tests }
BinomialGeneratorTest >> testBinomialGeneratorWithSuccessProbabilityOfOneAlwaysReturnNumberOfTrials [
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
]

{ #category : #tests }
BinomialGeneratorTest >> testBinomialGeneratorWithSuccessProbabilityOfZeroAlwaysReturnZero [
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
]
