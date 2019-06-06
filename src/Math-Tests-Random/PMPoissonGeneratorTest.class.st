Class {
	#name : #PMPoissonGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

{ #category : #tests }
PMPoissonGeneratorTest >> generateASampleOfSize: sampleSize usingGenerator: gen [
	| sample |
	sample := OrderedCollection new.
	sampleSize timesRepeat: [ sample add: gen next ].
	^ sample
]

{ #category : #tests }
PMPoissonGeneratorTest >> testPeekIsIdempotent [
	| poisson |
	poisson := PMPoissonGenerator lambda: 0.1.
	self assert: poisson peek equals: poisson peek
]

{ #category : #tests }
PMPoissonGeneratorTest >> testPeekReturnsSameAsNext [
	| poisson |
	poisson := PMPoissonGenerator lambda: 0.1.
	self assert: poisson peek equals: poisson next
]

{ #category : #tests }
PMPoissonGeneratorTest >> testPeekWorksAfterSampling [
	| poisson random |
	poisson := PMPoissonGenerator lambda: 0.1.
	1 to: 100 do: [ :ea | poisson next ].
	random := poisson peek.
	self assert: random equals: poisson peek.
	self assert: random equals: poisson next
]

{ #category : #tests }
PMPoissonGeneratorTest >> testSampleMeanConvergesToExpectedValue [
	"law of large numbers"

	"made non-random, old random version in comments"

	| gen sample |
	"((1000 atRandom: Random new) -1)"
	gen := PMPoissonGenerator lambda: 5.
	"added for non-randomness"
	gen generator seed: 42.

	sample := self generateASampleOfSize: 1000 usingGenerator: gen.
	self assert: sample average >= (gen expectedValue * 0.8).
	self assert: sample average <= (gen expectedValue * 1.2)
]
