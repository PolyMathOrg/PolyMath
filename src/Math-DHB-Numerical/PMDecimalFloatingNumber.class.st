"
A PMDecimalFloatingNumber is a demonstration of floating point arithmetic and rounding errors. The implementation uses decimal digits to allow easier human reading and understanding, and hand-worked examples. Only basic arithmetic operations are specified (+, -,*, sqrt). 

The message #value answers a fraction which is the exact representation of the stored number. 

The message #normalize uses truncation to fit the best precision possible. It is at this step that roundoff errors occur. #normalize is called when these numbers are created.

This class is detailed in appendix A of Didier Besset's book.
"
Class {
	#name : #PMDecimalFloatingNumber,
	#superclass : #Object,
	#instVars : [
		'mantissa',
		'exponent'
	],
	#classVars : [
		'Digits'
	],
	#category : #'Math-DHB-Numerical-Math-FunctionIterator'
}

{ #category : #information }
PMDecimalFloatingNumber class >> defaultDigits [
	"Private"

	^ 15
]

{ #category : #transformation }
PMDecimalFloatingNumber class >> defaultDigits: anInteger [
	"Private"

	Digits := anInteger
]

{ #category : #information }
PMDecimalFloatingNumber class >> digits [
	"Private"

	Digits isNil
		ifTrue: [ Digits := self defaultDigits ].
	^ Digits
]

{ #category : #creation }
PMDecimalFloatingNumber class >> new: aNumber [
	^ self new normalize: aNumber
]

{ #category : #transformation }
PMDecimalFloatingNumber class >> resetDigits [
	"Private"

	Digits := nil
]

{ #category : #operation }
PMDecimalFloatingNumber >> * aNumber [
	^ self class new: self value * aNumber value
]

{ #category : #operation }
PMDecimalFloatingNumber >> + aNumber [
	^ self class new: self value + aNumber value
]

{ #category : #operation }
PMDecimalFloatingNumber >> - aNumber [
	^ self class new: self value - aNumber value
]

{ #category : #operation }
PMDecimalFloatingNumber >> / aNumber [
	^ self class new: self value / aNumber value
]

{ #category : #transformation }
PMDecimalFloatingNumber >> normalize: aNumber [
	"Private"

	exponent := (self class digits - (aNumber log: 10)) floor.
	mantissa := (aNumber * (10 raisedToInteger: exponent)) truncated.
	^ self
]

{ #category : #display }
PMDecimalFloatingNumber >> printOn: aStream [
	mantissa printOn: aStream.
	aStream nextPutAll: 'xE'.
	exponent negated printOn: aStream
]

{ #category : #operation }
PMDecimalFloatingNumber >> sqrt [
	^ self class new: self value sqrt
]

{ #category : #information }
PMDecimalFloatingNumber >> value [
	^ mantissa / (10 raisedToInteger: exponent)
]
