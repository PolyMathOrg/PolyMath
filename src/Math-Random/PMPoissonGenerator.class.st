"
A PoissonGeneratorsimulates a Poisson Process with parameter lambda.

This class is implemented to yield an integer result, corresponding to the number of events in n intervals, with probabilility of an event in each individual interval of p. The parameter lambda is the product of n and p.
"
Class {
	#name : #PMPoissonGenerator,
	#superclass : #PMNumberGenerator,
	#instVars : [
		'lambda'
	],
	#category : 'Math-Random'
}

{ #category : #'instance creation' }
PMPoissonGenerator class >> lambda: aNumber [
	^ self basicNew
		generator: self defaultGeneratorClass new;
		lambda: aNumber; 
		yourself
]

{ #category : #'instance creation' }
PMPoissonGenerator class >> new [
	^ self lambda: 1
]

{ #category : #accessing }
PMPoissonGenerator >> lambda [
	^ lambda
]

{ #category : #accessing }
PMPoissonGenerator >> lambda: anObject [
	lambda := anObject.
	
]

{ #category : #'stream access' }
PMPoissonGenerator >> next [
	"Generator based on multiplication of uniform random variable. Luc DeVroye, Non-Uniform Random Variate Generation, Section X.3"

	| x prod limit |
	limit := self lambda negated exp.
	x := 0.
	prod := 1.
	[ true ]
		whileTrue:
			[ | u |
			u := self generator next.
			prod := u * prod.
			prod > limit
				ifTrue: [ x := x + 1 ]
				ifFalse: [ ^ x ] ]
]
