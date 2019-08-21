"
A PMBernoulliGenerator is simulates a Bernoulli Process. This is a discrete process, with probability of p for success, and 1-p for failure. 

next
	answer 1 if success event, 0 otherwise
	
generator:
	provide a uniform [0,1] random number generator
	
p: 
	set the probability of success events
	
class methods

withProbability:
	create a generator with probability set to p
	
defaultGeneratorClass
	class used for generator in new instances
"
Class {
	#name : #PMBernoulliGenerator,
	#superclass : #PMNumberGenerator,
	#instVars : [
		'probability'
	],
	#category : #'Math-Random'
}

{ #category : #'instance creation' }
PMBernoulliGenerator class >> fair [
	^ self withProbability: 0.5
]

{ #category : #private }
PMBernoulliGenerator class >> validProbability: aProbability [
	"reject probabilities outside of [0,1]"

	self assert: [ (aProbability < 0) not and: (aProbability > 1) not ]
]

{ #category : #'instance creation' }
PMBernoulliGenerator class >> withProbability: p [
	self validProbability: p.
	^ self new probability: p
]

{ #category : #initialization }
PMBernoulliGenerator >> initialize [
	super initialize.
	self generator: self class defaultGeneratorClass new.
	self probability: 0.5
]

{ #category : #'stream accessing' }
PMBernoulliGenerator >> next [
	^ randomNumberGenerator next < probability
		ifTrue: [ 1 ]
		ifFalse: [ 0 ]
]

{ #category : #accessing }
PMBernoulliGenerator >> probability [
	^ probability
]

{ #category : #accessing }
PMBernoulliGenerator >> probability: aProbability [
	self class validProbability: aProbability.
	probability := aProbability
]
