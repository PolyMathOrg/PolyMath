"
I implement Bisection zero finder for the scalar problem f(x)=0 when it is known the single root exists on the interval (a, b)
"
Class {
	#name : #PMBisectionZeroFinder,
	#superclass : #PMFunctionalIterator,
	#instVars : [
		'positiveX',
		'negativeX'
	],
	#category : #'Math-Numerical-Math-FunctionIterator'
}

{ #category : #operation }
PMBisectionZeroFinder >> computeInitialValues [
	"Private"

	positiveX ifNil: [ self error: 'No positive value supplied' ].
	negativeX ifNil: [ self error: 'No negative value supplied' ]
]

{ #category : #operation }
PMBisectionZeroFinder >> evaluateIteration [
		"Perform one step of bisection."
	result := ( positiveX + negativeX) * 0.5.
	( functionBlock value: result) > 0
		ifTrue: [ positiveX := result]
		ifFalse:[ negativeX := result].
	^self relativePrecision: ( positiveX - negativeX) abs
]

{ #category : #operation }
PMBisectionZeroFinder >> findNegativeXFrom: aNumber1 range: aNumber2 [
	| random n |
	n := 0.
	random := Random new.
	
	[ negativeX := random next * aNumber2 + aNumber1.
	  ( functionBlock value: negativeX) < 0
		] whileFalse: [ n := n + 0.1.
						n > maximumIterations
							ifTrue: [ self error: 'Unable to find a negative function value'].
					  ]
]

{ #category : #operation }
PMBisectionZeroFinder >> findPositiveXFrom: aNumber1 range: aNumber2 [
	| n random |
	n := 0.
	random := Random new.
	
	[ positiveX := random next * aNumber2 + aNumber1.
	  ( functionBlock value: positiveX) > 0
		] whileFalse: [ n := n + 1.
						n > maximumIterations
							ifTrue: [ self error: 'Unable to find a positive function value'].
					  ]
]

{ #category : #initialization }
PMBisectionZeroFinder >> setNegativeX: aNumber [
	( functionBlock value: aNumber) < 0
		ifFalse:[ self error: 'Function is not negative at x = ', aNumber printString].
	negativeX := aNumber
]

{ #category : #initialization }
PMBisectionZeroFinder >> setPositiveX: aNumber [
	( functionBlock value: aNumber) > 0
		ifFalse:[ self error: 'Function is not positive at x = ', aNumber printString].
	positiveX := aNumber
]
