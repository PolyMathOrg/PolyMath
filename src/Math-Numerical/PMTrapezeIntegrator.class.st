"
A PMTrapezeIntegrator is the base class for integration methods. You should not use this class for real applications, since much better results can be obtained from Romberg or Simpson integration.


"
Class {
	#name : #PMTrapezeIntegrator,
	#superclass : #PMFunctionalIterator,
	#instVars : [
		'from',
		'to',
		'sum',
		'step'
	],
	#category : #'Math-Numerical'
}

{ #category : #information }
PMTrapezeIntegrator class >> defaultMaximumIterations [
	^13
]

{ #category : #creation }
PMTrapezeIntegrator class >> function: aBlock from: aNumber1 to: aNumber2 [
		"Create an new instance with given parameters."
	^super new initialize: aBlock from: aNumber1 to: aNumber2
]

{ #category : #operation }
PMTrapezeIntegrator >> computeInitialValues [
		"Private"
	step := to - from.
	sum := ( ( functionBlock value: from) + ( functionBlock value: to)) * step /2.
	result := sum
]

{ #category : #operation }
PMTrapezeIntegrator >> evaluateIteration [
	| oldResult |
	oldResult := result.
	result := self higherOrderSum.
	^self relativePrecision: ( result - oldResult) abs
]

{ #category : #initialization }
PMTrapezeIntegrator >> from: aNumber1 to: aNumber2 [
	from := aNumber1.
	to := aNumber2
]

{ #category : #transformation }
PMTrapezeIntegrator >> higherOrderSum [
		"Private"
	| x newSum |
	x := step / 2 + from.
	newSum := 0.
	[ x < to ]
		whileTrue: [ newSum := ( functionBlock value: x) + newSum.
					 x := x + step.
				   ].
	sum := ( step * newSum + sum) / 2.
	step := step / 2.
	^sum
]

{ #category : #initialization }
PMTrapezeIntegrator >> initialize: aBlock from: aNumber1 to: aNumber2 [
		"Private"
	functionBlock := aBlock.
	self from: aNumber1 to: aNumber2
]
