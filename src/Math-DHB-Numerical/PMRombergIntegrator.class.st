"
A DhbRombergIntegrator implements the Romberg Method. This uses Richardson extrapolation on the Trapezoid method to generate a higher order estimate.

Evenly spaced samples are used. 

See also:
http://en.wikipedia.org/wiki/Romberg%27s_method

methods:

order: anInteger
	number of rows in the tableau.
	

"
Class {
	#name : #PMRombergIntegrator,
	#superclass : #PMTrapezeIntegrator,
	#instVars : [
		'order',
		'points',
		'interpolator'
	],
	#category : #'Math-DHB-Numerical'
}

{ #category : #information }
PMRombergIntegrator class >> defaultOrder [
		"Private"
	^5
]

{ #category : #operation }
PMRombergIntegrator >> computeInitialValues [
		"Private"
	super computeInitialValues.
	points := OrderedCollection new: order.
	interpolator := PMNevilleInterpolator points: points.
	points add: 1 @ sum
]

{ #category : #operation }
PMRombergIntegrator >> evaluateIteration [
	| interpolation |
	points addLast: (points last x * 0.25) @ self higherOrderSum.
	points size < order
		ifTrue: [ ^1].
	interpolation := interpolator valueAndError: 0.
	points removeFirst.
	result := interpolation at: 1.
	^self relativePrecision: ( interpolation at: 2) abs
]

{ #category : #initialization }
PMRombergIntegrator >> initialize [
		"Private"
	order := self class defaultOrder.
	^super initialize
]

{ #category : #initialization }
PMRombergIntegrator >> order: anInteger [
	anInteger < 2
		ifTrue: [ self error: 'Order for Romberg integration must be larger than 1'].
	order := anInteger
]
