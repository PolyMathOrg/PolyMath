"
In linear algebra, dual numbers extend the real numbers by adjoining one new element ε with the property ε^2 = 0 (ε is nilpotent). See here: [https://en.wikipedia.org/wiki/Dual_number](https://en.wikipedia.org/wiki/Dual_number)

`PMDualNumber`s can be used to calculate the first derivative if one  creates them this way:

```
PMDualNumber value: aNumber eps: derivativeOfANumber
```
 (1 if the derivative with respect to aNumber is calculated, 0 otherwise)

`PMDualNumber`s can be mixed with Numbers.
"
Class {
	#name : #PMDualNumber,
	#superclass : #Number,
	#instVars : [
		'value',
		'eps'
	],
	#classVars : [
		'ZeroApproximation'
	],
	#category : #'Math-AutomaticDifferenciation'
}

{ #category : #'instance creation' }
PMDualNumber class >> value: aValue [
	^ (self new value: aValue) eps: 0
]

{ #category : #'instance creation' }
PMDualNumber class >> value:aValue eps: anEps [
^(self new value: aValue) eps: anEps
]

{ #category : #accessing }
PMDualNumber class >> zeroApproximation [
"so far only used experimentally where i think it should produce no real problems, but i guess it should be used in #/, #arcSin, #arcCos, #raisedTo: and perhaps in #tan. additionally i used it wrongly as it should in general cover the range of -1.0e-100 to 1.0e-100 and not only zero (but i have always these speed-problems <g> ). perhaps i should thow it out completely, i noticed that several other implementations simply ignore those special cases. anyway, one can also set it to 0 with self class zeroApproximation:0, so that one gets a divideByZero error. another alternative would be to return infinity in some cases and a specialized singularity error in other ones. dont know."
	^ ZeroApproximation ifNil: [ZeroApproximation :=1.0e-100]
]

{ #category : #accessing }
PMDualNumber class >> zeroApproximation: aSmallNumber [
"see comment in zeroApproximation"
^ZeroApproximation := aSmallNumber
]

{ #category : #arithmetic }
PMDualNumber >> * aNumber [
	^ aNumber multiplyDualNumber: self
]

{ #category : #arithmetic }
PMDualNumber >> + aNumber [
	^ aNumber addDualNumber: self
]

{ #category : #arithmetic }
PMDualNumber >> - aNumber [
	^ aNumber negated addDualNumber: self
]

{ #category : #arithmetic }
PMDualNumber >> / aNumber [

	^ aNumber reciprocal multiplyDualNumber: self
]

{ #category : #testing }
PMDualNumber >> < aDualNumber [
	^ value < aDualNumber value
]

{ #category : #comparing }
PMDualNumber >> = aMagnitude [
	^ aMagnitude = value
]

{ #category : #arithmetic }
PMDualNumber >> abs [
^value<0 ifTrue:[self negated]ifFalse:[self]
]

{ #category : #arithmetic }
PMDualNumber >> absSquared [
	^ (self conjugated * self) real
]

{ #category : #converting }
PMDualNumber >> adaptToFraction: rcvr andSend: selector [
	^ (self class value: rcvr) perform: selector with: self
]

{ #category : #converting }
PMDualNumber >> adaptToInteger: rcvr andSend: selector [
	^ (self class value: rcvr) perform: selector with: self
]

{ #category : #arithmetic }
PMDualNumber >> addDualNumber: aDualNumber [
	^ self class
		value: value + aDualNumber value
		eps: eps + aDualNumber eps
]

{ #category : #'mathematical functions' }
PMDualNumber >> arcCos [
	^ self class
		value: value arcCos
		eps: eps negated /  (1 - value squared)sqrt
]

{ #category : #'mathematical functions' }
PMDualNumber >> arcSin [
	^ self class
		value: value arcSin
		eps: eps /  (1 - value squared)sqrt
]

{ #category : #'mathematical functions' }
PMDualNumber >> arcTan [
	^ self class value: value arcTan eps: eps / (1 + value squared)
]

{ #category : #converting }
PMDualNumber >> asFloat [
	^ value asFloat
]

{ #category : #converting }
PMDualNumber >> asInteger [
	^ value asInteger
]

{ #category : #comparing }
PMDualNumber >> closeTo: aDualNumber [

	^ self closeTo: aDualNumber precision: Float defaultComparisonPrecision
]

{ #category : #comparing }
PMDualNumber >> closeTo: aDualNumber precision: aPrecision [

	^ (value closeTo: aDualNumber value precision: aPrecision) and: [ eps closeTo: aDualNumber eps precision: aPrecision ]
]

{ #category : #'mathematical functions' }
PMDualNumber >> conjugated [

	^ self class
		  value: self value complexConjugate
		  eps: self eps asComplex complexConjugate
]

{ #category : #'mathematical functions' }
PMDualNumber >> cos [
	^ self class value: value cos eps: eps * value sin negated
]

{ #category : #accessing }
PMDualNumber >> eps [
	^ eps
]

{ #category : #accessing }
PMDualNumber >> eps: aNumber [
	eps := aNumber
]

{ #category : #comparing }
PMDualNumber >> equalsTo: aDualNumber [

	self
		deprecated: 'Use closeTo: instead'
		transformWith: '`@rec equalsTo: `@arg' -> '`@rec closeTo: `@arg'.

	^ self closeTo: aDualNumber
]

{ #category : #testing }
PMDualNumber >> even [
	^value \\ 2 = 0
]

{ #category : #'mathematical functions' }
PMDualNumber >> exp [
	| e |
	e := value exp.
	^ self class value: e eps: eps * e
]

{ #category : #comparing }
PMDualNumber >> hash [
	^ value hash
]

{ #category : #testing }
PMDualNumber >> isDualNumber [
	^ true
]

{ #category : #testing }
PMDualNumber >> isInfinite [
	^ value isInfinite
]

{ #category : #testing }
PMDualNumber >> isNaN [
	^ value isNaN
]

{ #category : #testing }
PMDualNumber >> isZero [
	^value = 0
]

{ #category : #'mathematical functions' }
PMDualNumber >> ln [
	| v |
	v := value.
	v = 0
		ifTrue: [ v := self class zeroApproximation ].
	^ self class value: value ln eps: eps / v
]

{ #category : #arithmetic }
PMDualNumber >> multiplyDualNumber: aDualNumber [
	^self class
				value: value * aDualNumber value
				eps: eps * aDualNumber value + (aDualNumber eps * value)
]

{ #category : #arithmetic }
PMDualNumber >> negated [
^self class value: value negated eps: eps negated
]

{ #category : #testing }
PMDualNumber >> negative [
	^ value < 0
]

{ #category : #testing }
PMDualNumber >> odd [
	^self even not
]

{ #category : #testing }
PMDualNumber >> positive [
	^ value >= 0
]

{ #category : #printing }
PMDualNumber >> printOn: aStream [
	"Append a sequence of characters that identify the receiver to aStream."

	aStream
		nextPutAll: self class name;
		nextPutAll: '(value: ';
		print: value;
		nextPutAll: ' eps: ';
		print: eps;
		nextPutAll: ')'
]

{ #category : #printing }
PMDualNumber >> printOn: aStream base: base [
	self printOn: aStream
]

{ #category : #'mathematical functions' }
PMDualNumber >> raisedTo: aDualNumber [
	| v |
	value = 0
		ifTrue: [ ^ self class value: 0 ].
	v := value raisedTo: aDualNumber value.
	aDualNumber isDualNumber
		ifFalse: [ ^ self class value: v eps: v / value * eps * aDualNumber ].
	^ self class
		value: v
		eps: v * (eps * aDualNumber value / value + (aDualNumber eps * value ln))
]

{ #category : #'mathematical functions' }
PMDualNumber >> raisedToInteger: anInteger [
	^ anInteger = 0
		ifTrue: [ self class value: 1 eps: 0 ]
		ifFalse: [ self class value: (value raisedToInteger: anInteger) eps: anInteger * eps * (value raisedToInteger: anInteger - 1) ]
]

{ #category : #converting }
PMDualNumber >> real [
	^ self class value: self value real eps: self eps asComplex real
]

{ #category : #arithmetic }
PMDualNumber >> reciprocal [
	^ self class value: 1 / value eps: eps / value squared negated
]

{ #category : #'mathematical functions' }
PMDualNumber >> sin [
	^ self class value: value sin eps: eps * value cos
]

{ #category : #'mathematical functions' }
PMDualNumber >> sqrt [
	| d |
	d := 2 * value sqrt.
	d = 0
		ifTrue: [ d := self class zeroApproximation ].
	^ self class value: value sqrt eps: eps / d
]

{ #category : #'mathematical functions' }
PMDualNumber >> squared [
	^ self class value: value squared eps: 2 * eps * value
]

{ #category : #'mathematical functions' }
PMDualNumber >> tan [
	^ self class
		value: value tan
		eps: eps / value cos squared
]

{ #category : #accessing }
PMDualNumber >> value [
	^ value
]

{ #category : #accessing }
PMDualNumber >> value: anObject [
value := anObject
]
