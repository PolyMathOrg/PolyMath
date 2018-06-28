Class {
	#name : #PoissonGeneratorTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-Random'
}

{ #category : #tests }
PoissonGeneratorTest >> testPeekReturnsSameAsNext [
	| poisson random |
	poisson := PMPoissonGenerator lambda: 0.1.
	random := poisson peek.
	self assert: random equals: poisson next
]

{ #category : #tests }
PoissonGeneratorTest >> testPeekReturnsSameTwice [
	| poisson random |
	poisson := PMPoissonGenerator lambda: 0.1.
	random := poisson peek.
	self assert: random equals: poisson peek
]

{ #category : #tests }
PoissonGeneratorTest >> testPeekWorksAfterSampling [
	| poisson random |
	poisson := PMPoissonGenerator lambda: 0.1.
	(1 to: 100) do: [ :ea | poisson next ].
	random := poisson peek.
	self assert: random equals: poisson peek.
	self assert: random equals: poisson next
]

{ #category : #tests }
PoissonGeneratorTest >> testSampleAverageConvergesToLambda [
	"law of large numbers"

	"made non-random, old random version in comments"

	| poisson samples |
	samples := OrderedCollection new.
	poisson := PMPoissonGenerator lambda: 5.	"((1000 atRandom: Random new) -1)"
	poisson generator seed: 42.	"added for non-randomness"
	1000 timesRepeat: [ samples add: poisson next ].
	self assert: samples average >= (poisson lambda * 0.8).
	self assert: samples average <= (poisson lambda * 1.2)
]
