"
A PMLagrangeInterpolator takes a set of points (include each with #add:) and interpolates values using the Lagrange Interpolation Polynomial. This is the polynomial of minimum degree through all points in the pointCollection.

This is appropriate for interpolation only (interior to the region of the set of values), and sensitive to several conditions.

The method value: yields an approximation at a given value of the independent variable. Calculation is deferred until value is sent. If the set of points is fixed, NewtonInterpolator precomputes the value function. If the set of points is likely to change more often than interpolated values are needed, this is a fair choice.

(c) Copyrights Didier BESSET, 2000
"
Class {
	#name : #PMLagrangeInterpolator,
	#superclass : #Object,
	#instVars : [
		'pointCollection'
	],
	#category : 'Math-DHB-Numerical-Math-Interpolator'
}

{ #category : #creation }
PMLagrangeInterpolator class >> points: aCollectionOfPoints [
	"Create a new instance of the receiver with given points."
	^self new initialize: aCollectionOfPoints
]

{ #category : #transformation }
PMLagrangeInterpolator >> add: aPoint [
	"Add a point to the collection of points."
	^pointCollection add: aPoint
]

{ #category : #information }
PMLagrangeInterpolator >> defaultSamplePoints [

	^OrderedCollection new
]

{ #category : #initialization }
PMLagrangeInterpolator >> initialize [

	^self initialize: self defaultSamplePoints
]

{ #category : #initialization }
PMLagrangeInterpolator >> initialize: aCollectionOfPoints [

	pointCollection := aCollectionOfPoints.
	^self
]

{ #category : #information }
PMLagrangeInterpolator >> size [

	^pointCollection size
]

{ #category : #information }
PMLagrangeInterpolator >> value: aNumber [
	"Compute the value of the Lagrange interpolation polynomial on the receiver's points at aNumber."
	| norm dx products answer size |
	norm := 1.
	size := pointCollection size.
	products := Array new: size.
	products atAllPut: 1.
	1 to: size
		do: [ :n |
			  dx := aNumber - ( self xPointAt: n).
			  dx = 0
				ifTrue: [ ^( self yPointAt: n)].
			  norm := norm * dx.
			  1 to: size
				do: [ :m |
					  m = n
						ifFalse:[ products at: m put: ( (( self xPointAt: m) - ( self xPointAt: n)) * ( products at: m))].
					].
			].
	answer := 0.
	1 to: size do:
		[ :n | answer := ( self yPointAt: n) / ( ( products at: n) * ( aNumber - ( self xPointAt: n))) + answer].
	^norm * answer
]

{ #category : #information }
PMLagrangeInterpolator >> xPointAt: anInteger [

	^( pointCollection at: anInteger) x
]

{ #category : #information }
PMLagrangeInterpolator >> yPointAt: anInteger [

	^( pointCollection at: anInteger) y
]
