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
PMPoissonGeneratorTest >> testSampleMeanConvergesToLambda [
	"law of large numbers"

	"made non-random, old random version in comments"

	| poisson sample |
	poisson := PMPoissonGenerator lambda: 5.	"((1000 atRandom: Random new) -1)"
	poisson generator seed: 42.	"added for non-randomness"
	
	sample := OrderedCollection new.
	1000 timesRepeat: [ sample add: poisson next ].
	
	self assert: sample average >= (poisson lambda * 0.8).
	self assert: sample average <= (poisson lambda * 1.2)
]
