Class {
	#name : #PMSplineInterpolator,
	#superclass : #PMNewtonInterpolator,
	#instVars : [
		'startPointDerivative',
		'endPointDerivative'
	],
	#category : #'Math-Numerical-Math-Interpolator'
}

{ #category : #transformation }
PMSplineInterpolator >> computeSecondDerivatives [

	| size u w s dx inv2dx |
	size := pointCollection size.
	coefficients := Array new: size.
	u := Array new: size - 1.
	startPointDerivative
		ifNil: [
			coefficients at: 1 put: 0.
			u at: 1 put: 0 ]
		ifNotNil: [
			coefficients at: 1 put: -1 / 2.
			s := 1 / ((self xPointAt: 2) - (self xPointAt: 1)).
			u at: 1 put: 3 * s * (s * ((self yPointAt: size) - (self yPointAt: size - 1)) - startPointDerivative) ].
	2 to: size - 1 do: [ :n |
		dx := (self xPointAt: n) - (self xPointAt: n - 1).
		inv2dx := 1 / ((self xPointAt: n + 1) - (self xPointAt: n - 1)).
		s := dx * inv2dx.
		w := 1 / (s * (coefficients at: n - 1) + 2).
		coefficients at: n put: s - 1 * w.
		u
			at: n
			put:
				(self yPointAt: n + 1) - (self yPointAt: n) / ((self xPointAt: n + 1) - (self xPointAt: n)) - ((self yPointAt: n) - (self yPointAt: n - 1) / dx) * 6
				* inv2dx - ((u at: n - 1) * s) * w ].
	endPointDerivative
		ifNil: [ coefficients at: size put: 0 ]
		ifNotNil: [
			w := 1 / 2.
			s := 1 / ((self xPointAt: size) - (self xPointAt: size - 1)).
			u at: 1 put: 3 * s * (endPointDerivative - (s * (self yPointAt: size) - (self yPointAt: size - 1))).
			coefficients at: size put: s - (w * (u at: size - 1) / ((coefficients at: size - 1) * w + 1)) ].
	size - 1 to: 1 by: -1 do: [ :n | coefficients at: n put: (coefficients at: n) * (coefficients at: n + 1) + (u at: n) ]
]

{ #category : #information }
PMSplineInterpolator >> defaultSamplePoints [
		
	^SortedCollection sortBlock: [ :a :b | a x < b x]
]

{ #category : #initialization }
PMSplineInterpolator >> endPointDerivative: aNumber [
	"Defines the end point derivatives."
	endPointDerivative := aNumber.
	self resetCoefficients.
]

{ #category : #information }
PMSplineInterpolator >> resetEndPointDerivatives [
	"Set the end point derivatives to undefined."
	self setEndPointDerivatives: ( Array new: 2).
]

{ #category : #information }
PMSplineInterpolator >> setEndPointDerivatives: anArray [
	"Defines the end point derivatives."
	startPointDerivative := anArray at: 1.
	endPointDerivative := anArray at: 2.
	self resetCoefficients.
]

{ #category : #information }
PMSplineInterpolator >> startPointDerivative: aNumber [
	"Defines the end point derivatives."
	startPointDerivative := aNumber.
	self resetCoefficients.
]

{ #category : #information }
PMSplineInterpolator >> value: aNumber [
	"Computes the value of a cubic spline interpolation over the points of the receiver."

	| n1 n2 n step a b |
	coefficients ifNil: [ self computeSecondDerivatives ].
	n2 := pointCollection size.
	n1 := 1.
	[ n2 - n1 > 1 ] whileTrue: [
		n := n1 + n2 // 2.
		(self xPointAt: n) > aNumber
			ifTrue: [ n2 := n ]
			ifFalse: [ n1 := n ] ].
	step := (self xPointAt: n2) - (self xPointAt: n1).
	a := (self xPointAt: n2) - aNumber / step.
	b := aNumber - (self xPointAt: n1) / step.
	^ a * (self yPointAt: n1) + (b * (self yPointAt: n2))
	  + (a * (a squared - 1) * (coefficients at: n1) + (b * (b squared - 1) * (coefficients at: n2)) * step squared / 6)
]
