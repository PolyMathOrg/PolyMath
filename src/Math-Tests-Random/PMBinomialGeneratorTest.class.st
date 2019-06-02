Class {
	#name : #PMBinomialGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

{ #category : #tests }
PMBinomialGeneratorTest >> testBinomialGeneratorConvergesToMean [
	"Its purpose is to verify correct convergence of the binomial distribution, 
	should be Normal (np, np(1-p))"

	| gen nums mean probabilityOfSuccess numberOfTrials |
	probabilityOfSuccess := (Random seed: 0.0) next sqrt.
	numberOfTrials := 1000.
	gen := PMBinomialGenerator
		numberOfTrials: numberOfTrials
		probabilityOfSuccess: probabilityOfSuccess.
	
	nums := OrderedCollection new.
	1 to: numberOfTrials do: [ :ea | nums add: gen next ].
	
	mean := numberOfTrials * probabilityOfSuccess.
	self assert: nums min > (mean * (1 - 0.2)).
	self assert: nums max < (mean * (1 + 0.2)).
	self assert: (nums average - mean) abs < 5
]

{ #category : #tests }
PMBinomialGeneratorTest >> testBinomialGeneratorWithSuccessProbabilityOfOneAlwaysReturnNumberOfTrials [
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
PMBinomialGeneratorTest >> testBinomialGeneratorWithSuccessProbabilityOfZeroAlwaysReturnZero [
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
