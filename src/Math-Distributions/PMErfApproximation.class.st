"
A `PMErfApproximation` is a five term approximation to erf(x). This is a singleton class encapsulating the approximation. 

Use with 

```
PMErfApproximation new value: aNumber
```

to receive erf(x). The result of the error function lies between zero and one.

An extension to Number exists, so the simpler use is

aNumber errorFunction 

which produces the same result.

If you need the error function as a function, you will need to enclose it in a block as:

| errorFunction |
errorFunction := [:x | x errorFunction].

Instance variables constant and series are part of the approximation formula. norm is a scale factor to make erf(infinity) = 1.

The error function is the Cumulative Distribution of the standard normal distribution. Thus, erf(x) represents the probability of a random variable with standard normal distribution being less than x. The approximation used is credited to Abramowitz and Stegun's Handbook of Mathematical Functions. The error function is detailed in Chapter 7. The implementation is detailed in PM's book Section 2.3

Additional resources available from NIST Digital Library of Mathematics at:
http://dlmf.nist.gov/7


"
Class {
	#name : #PMErfApproximation,
	#superclass : #Object,
	#instVars : [
		'constant',
		'series',
		'norm'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Math-Distributions-Core'
}

{ #category : #creation }
PMErfApproximation class >> new [
	"Answer a unique instance. Create it if it does not exist."
	UniqueInstance isNil
		ifTrue: [ UniqueInstance := super new.
					 UniqueInstance initialize ].
	^UniqueInstance
]

{ #category : #creation }
PMErfApproximation class >> reset [
	"ensure a new UniqueInstance is built when used next"
	UniqueInstance := nil.
]

{ #category : #initialization }
PMErfApproximation >> initialize [
	constant := 0.2316419.
	norm := 1 / (Float pi * 2) sqrt.
	series := PMPolynomial
		coefficients:
			#(0.31938153 -0.356563782 1.781477937 -1.821255978 1.330274429)
]

{ #category : #information }
PMErfApproximation >> normal: aNumber [
	"Computes the value of the Normal distribution for aNumber"

	^ [ (aNumber squared * -0.5) exp * norm ]
		on: Error
		do: [ :signal | signal return: 0 ]
]

{ #category : #information }
PMErfApproximation >> value: aNumber [
	"Answer erf(aNumber) using an approximation from Abramovitz and Stegun, Handbook of Mathematical Functions."

	| t |
	aNumber = 0
		ifTrue: [ ^ 0.5 ].
	aNumber > 0
		ifTrue: [ ^ 1
				- (self value: aNumber negated) ].
	aNumber < -20
		ifTrue: [ ^ 0 ].
	t := 1 / (1 - (constant * aNumber)).
	^ (series value: t) * t
		* (self normal: aNumber)
]
