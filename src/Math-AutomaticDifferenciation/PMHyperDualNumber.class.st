"
`PMHyperDualNumber` can be used to additionally calculate second order derivatives.
They can be mixed with `Number`s, not with `PMDualNumber`s.
"
Class {
	#name : #PMHyperDualNumber,
	#superclass : #PMDualNumber,
	#instVars : [
		'eps2',
		'eps1eps2'
	],
	#category : #'Math-AutomaticDifferenciation'
}

{ #category : #'instance creation' }
PMHyperDualNumber class >> value: aValue [
	^ (((self new value: aValue) eps: 0) eps2: 0) eps1eps2: 0
]

{ #category : #'instance creation' }
PMHyperDualNumber class >> value: aValue eps: anEps [
	^ (((self new value: aValue) eps: anEps) eps2: 0) eps1eps2: 0
]

{ #category : #'instance creation' }
PMHyperDualNumber class >> value: aValue eps: anEps eps2: anEps2 eps1eps2: anEps1eps2 [
	^ (((self new value: aValue) eps: anEps) eps2: anEps2)
		eps1eps2: anEps1eps2
]

{ #category : #arithmetic }
PMHyperDualNumber >> * aHyperDualNumber [
	|r|
	r := super * aHyperDualNumber.
	aHyperDualNumber isDualNumber
		ifFalse:[ r eps2:eps2 * aHyperDualNumber; eps1eps2: eps1eps2 * aHyperDualNumber]
		ifTrue: [r eps2: eps2 * aHyperDualNumber value + (aHyperDualNumber eps2 *value);
						eps1eps2: value * aHyperDualNumber eps1eps2 +(eps * aHyperDualNumber eps2)+(eps2 * aHyperDualNumber eps)+(eps1eps2 * aHyperDualNumber value)].
	^ r
]

{ #category : #arithmetic }
PMHyperDualNumber >> + aHyperDualNumber [
	|r|
	r := super + aHyperDualNumber.
	aHyperDualNumber isDualNumber
		ifFalse:[ r eps2:eps2; eps1eps2: eps1eps2]
		ifTrue: [r eps2: eps2 + aHyperDualNumber eps2; eps1eps2: eps1eps2 + aHyperDualNumber eps1eps2].
	^ r
]

{ #category : #arithmetic }
PMHyperDualNumber >> - aHyperDualNumber [
	|r|
	r := super - aHyperDualNumber.
	aHyperDualNumber isDualNumber
		ifFalse: [ r eps2: eps2; eps1eps2: eps1eps2]
		ifTrue: [ r eps2: eps2 - aHyperDualNumber eps2; eps1eps2: eps1eps2 - aHyperDualNumber eps1eps2].
	^ r
]

{ #category : #arithmetic }
PMHyperDualNumber >> / aHyperDualNumber [
	^self * aHyperDualNumber reciprocal
]

{ #category : #'mathematical functions' }
PMHyperDualNumber >> arcCos [
	| a d |
	a := 1 - value squared.
	d := a sqrt negated.
	^ super arcCos
		eps2: eps2 / d;
		eps1eps2: eps1eps2 / d + (eps * eps2 * value negated / (a raisedTo: 3 / 2));
		yourself
]

{ #category : #'mathematical functions' }
PMHyperDualNumber >> arcSin [
	| a d |
	a := 1 - value squared.
	d := a sqrt.
	^ super arcSin
		eps2: eps2 / d;
		eps1eps2: eps1eps2 / d + (eps * eps2 * value / (a raisedTo: 3 / 2));
		yourself
]

{ #category : #'mathematical functions' }
PMHyperDualNumber >> arcTan [
	| a |
	a := 1 + value squared.
	^ super arcTan
		eps2: eps2 / a;
		eps1eps2: eps1eps2 / a + (-2 * eps * eps2 * value / a squared);
		yourself
]

{ #category : #comparing }
PMHyperDualNumber >> closeTo: aHyperDualNumber [

	^ (super closeTo: aHyperDualNumber) and: [
		  (eps2 closeTo: aHyperDualNumber eps2) and: [
			  eps1eps2 closeTo: aHyperDualNumber eps1eps2 ] ]
]

{ #category : #comparing }
PMHyperDualNumber >> closeTo: aHyperDualNumber precision: aPrecision [

	^ (super closeTo: aHyperDualNumber asFloat precision: aPrecision) and: [
		  (eps2 closeTo: aHyperDualNumber eps2 precision: aPrecision) and: [ eps1eps2 closeTo: aHyperDualNumber eps1eps2 precision: aPrecision ] ]
]

{ #category : #'mathematical functions' }
PMHyperDualNumber >> cos [
	^ super cos
		eps2: eps2 * value sin negated;
		eps1eps2: (eps1eps2 * value sin + (eps * eps2 * value cos)) negated;
		yourself
]

{ #category : #accessing }
PMHyperDualNumber >> eps1eps2 [
	^ eps1eps2
]

{ #category : #accessing }
PMHyperDualNumber >> eps1eps2: anEps [
	eps1eps2 := anEps
]

{ #category : #accessing }
PMHyperDualNumber >> eps2 [
	^ eps2
]

{ #category : #accessing }
PMHyperDualNumber >> eps2: anEps2 [
	eps2 := anEps2
]

{ #category : #comparing }
PMHyperDualNumber >> equalsTo: aHyperDualNumber [

	self
		deprecated: 'Use closeTo: instead'
		transformWith: '`@rec equalsTo: `@arg' -> '`@rec closeTo: `@arg'.

	^ self closeTo: aHyperDualNumber
]

{ #category : #'mathematical functions' }
PMHyperDualNumber >> exp [
	| e |
	e := value exp.
	^ super exp
		eps2: eps2 * e;
		eps1eps2: (eps * eps2 + eps1eps2) * e;
		yourself
]

{ #category : #'mathematical functions' }
PMHyperDualNumber >> ln [
	| v |
	v := value.
	v = 0
		ifTrue: [ v := self class zeroApproximation ].
	^ super ln
		eps2: eps2 / v;
		eps1eps2: eps1eps2 / v - (eps * eps2 / v squared);
		yourself
]

{ #category : #arithmetic }
PMHyperDualNumber >> negated [
	^ self class
		value: value negated
		eps: eps negated
		eps2: eps2 negated
		eps1eps2: eps1eps2 negated
]

{ #category : #printing }
PMHyperDualNumber >> printOn: aStream [
	"Append a sequence of characters that identify the receiver to aStream."

	aStream
		nextPutAll: self class name;
		nextPutAll: '(value: ';
		print: value;
		nextPutAll: ' eps1: ';
		print: eps;
		nextPutAll: ' eps2: ';
		print: eps2;
		nextPutAll: ' eps12: ';
		print: eps1eps2;
		nextPutAll: ')'
]

{ #category : #'mathematical functions' }
PMHyperDualNumber >> raisedTo: aHyperDualNumber [
	^ (self ln * aHyperDualNumber) exp
]

{ #category : #'mathematical functions' }
PMHyperDualNumber >> raisedToInteger: anInteger [
	| v |
	anInteger = 0
		ifTrue: [ ^ self class
				value: 1
				eps: 0
				eps2: 0
				eps1eps2: 0 ].
	v := value raisedToInteger: anInteger - 1.
	^ (super raisedToInteger: anInteger)
		eps2: anInteger * eps2 * v;
		eps1eps2:
			eps1eps2 * anInteger * v
				+
					(eps * eps2 * anInteger * (anInteger - 1)
						* (value raisedToInteger: anInteger - 2));
		yourself
]

{ #category : #arithmetic }
PMHyperDualNumber >> reciprocal [
	| s |
	s := value squared.
	^ self class
		value: 1 / value
		eps: eps / s negated
		eps2: eps2 / s negated
		eps1eps2: 2 * eps2 * eps / (s * value) - (eps1eps2 / s)
]

{ #category : #'mathematical functions' }
PMHyperDualNumber >> sin [
	^ super sin
		eps2: eps2 * value cos;
		eps1eps2: eps1eps2 * value cos - (eps * eps2 * value sin);
		yourself
]

{ #category : #'mathematical functions' }
PMHyperDualNumber >> sqrt [
	| d d2 |
	d := 2 * value sqrt.
	d2 := 4 * (value raisedTo: 3 / 2).
	d = 0
		ifTrue: [ d := self class zeroApproximation.
			d2 := 4 * (self class zeroApproximation raisedTo: 3 / 2) ].
	^ super sqrt
		eps2: eps2 / d;
		eps1eps2: eps1eps2 / d - (eps * eps2 / d2);
		yourself
]

{ #category : #'mathematical functions' }
PMHyperDualNumber >> squared [
	| e |
	e := 2 * value.
	^ super squared
		eps2: eps2 * e;
		eps1eps2: eps1eps2 * e + (eps * eps2 * 2);
		yourself
]

{ #category : #'mathematical functions' }
PMHyperDualNumber >> tan [
	| t |
	t := value cos squared.
	^ super tan
		eps2: eps / t;
		eps1eps2:
			eps1eps2 / t
				+ (eps * eps2 * 2 * value sin / (value cos raisedToInteger: 3));
		yourself
]
