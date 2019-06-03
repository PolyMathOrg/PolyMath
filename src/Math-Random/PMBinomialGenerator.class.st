"
A PMBinomialGenerator yields results from a binomial distribution with probability p and n trials. The generator is the underlying random source.

If each independent event has probability 0<p<1, and n trials are performed, next returns number of successes.
"
Class {
	#name : #PMBinomialGenerator,
	#superclass : #PMNumberGenerator,
	#instVars : [
		'numberOfTrials',
		'probability'
	],
	#category : #'Math-Random'
}

{ #category : #'instance-creation' }
PMBinomialGenerator class >> numberOfTrials: numberOfTrials probabilityOfSuccess: probabilityOfSuccess [
	^ self new 
		numberOfTrials: numberOfTrials;
		probability: probabilityOfSuccess; 
		yourself
]

{ #category : #accessing }
PMBinomialGenerator >> expectedValue [
	^ numberOfTrials * probability
]

{ #category : #initialization }
PMBinomialGenerator >> initialize [
	self generator: PMParkMillerMinimumRandomGenerator new.
	self numberOfTrials: 10; probability: 0.5
]

{ #category : #'stream access' }
PMBinomialGenerator >> next [
	| x |
	x := 0.
	numberOfTrials timesRepeat: [ randomNumberGenerator next <= probability ifTrue: [ x := x + 1 ] ].
	^ x
]

{ #category : #accessing }
PMBinomialGenerator >> numberOfTrials: anInteger [ 
	numberOfTrials := anInteger
]

{ #category : #accessing }
PMBinomialGenerator >> probability: aProbability [ 
	probability := aProbability
]
