"
A PMNewtonInterpolator is a specialized Lagrange Interpolator which precomputes the polynomial to be evaluated when interpolating. This is twice as expensive as direct evaluation, but produces a linear time (in the number of points) evaluation method for fixed points.

add: resets the coefficients

value: lazily initializes the coefficients and yields an interpolated value.

computeCoefficients and resetCoefficients should be considered private.
"
Class {
	#name : #PMNewtonInterpolator,
	#superclass : #PMLagrangeInterpolator,
	#instVars : [
		'coefficients'
	],
	#category : #'Math-Numerical-Math-Interpolator'
}

{ #category : #transformation }
PMNewtonInterpolator >> add: aPoint [
	"Add a point to the collection of points."
	self resetCoefficients.
	^super add: aPoint
]

{ #category : #information }
PMNewtonInterpolator >> computeCoefficients [
	"Private - Computes the coefficients for the receiver."
	| size k1 kn|
	size := pointCollection size.
	coefficients := ( 1 to: size) collect: [ :n | self yPointAt: n].
	1 to: (size - 1)
		do: [ :n |
			  size to: ( n + 1)  by: -1
				do: [ :k |
					  k1 := k - 1.
					  kn := k - n.
					  coefficients at: k put: ( (( coefficients at: k) - ( coefficients at: k1))
											/ ((self xPointAt: k) - (self xPointAt: kn))).
					].
			]
]

{ #category : #transformation }
PMNewtonInterpolator >> resetCoefficients [
	"Private - Reset the coefficients of the receiver to force a new computation."
	coefficients := nil
]

{ #category : #information }
PMNewtonInterpolator >> value: aNumber [
	"Compute the value of the Lagrange interpolation polynomial on the receiver's points at aNumber."

	| answer size |
	coefficients ifNil: [ self computeCoefficients ].
	size := coefficients size.
	answer := coefficients at: size.
	size - 1 to: 1 by: -1 do: [ :n | answer := answer * (aNumber - (self xPointAt: n)) + (coefficients at: n) ].
	^ answer
]
