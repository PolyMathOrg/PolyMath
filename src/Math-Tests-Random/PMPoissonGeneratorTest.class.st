Class {
	#name : #PMPoissonGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

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
	gen := PMPoissonGenerator lambda: 5.
	"added for non-randomness"
	gen generator seed: 42.

	sample := PMRandomSample ofSize: 1000 usingGenerator: gen.
	self assert: (sample average between: (gen expectedValue * 0.8) and: (gen expectedValue * 1.2))
]
