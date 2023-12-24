"
A PMPolynomial represents a single variable polynomial function as an array of coefficients.

The constructor coefficients: anArray expects coefficients in increasing degree, that is constant term first. So, for example, to represent X^2 + 2X, we want to create:

PMPolynomial coefficients: #(0 2 1)

The printOn: method similarly displays the polynomial from lowest nonzero degree to highest. 

PMPolynomial coefficients: #(0 2 1)   2 X +  X^2 


"
Class {
	#name : #PMPolynomial,
	#superclass : #Object,
	#instVars : [
		'coefficients'
	],
	#category : #'Math-Polynomials'
}

{ #category : #creation }
PMPolynomial class >> coefficients: anArray [
		" Creates a new instance with given coefficients"
	^self new initialize: anArray reverse
]

{ #category : #operation }
PMPolynomial >> * aNumberOrPolynomial [

	^aNumberOrPolynomial timesPolynomial: self
]

{ #category : #operation }
PMPolynomial >> + aNumberOrPolynomial [

	^aNumberOrPolynomial addPolynomial: self
]

{ #category : #operation }
PMPolynomial >> - aNumberOrPolynomial [

	^aNumberOrPolynomial subtractToPolynomial: self
]

{ #category : #operation }
PMPolynomial >> / aNumberOrPolynomial [

	^aNumberOrPolynomial dividingPolynomial: self
]

{ #category : #comparing }
PMPolynomial >> = aNumberOrPolynomial [
	^(aNumberOrPolynomial class = self class) and: [self coefficients = aNumberOrPolynomial coefficients]
]

{ #category : #'double dispatching' }
PMPolynomial >> adaptToNumber: rcvr andSend: selector [
	^(self class coefficients: (Array with: rcvr) ) perform: selector with: self
]

{ #category : #'double dispatching' }
PMPolynomial >> addNumber: aNumber [

	| newCoefficients |
	newCoefficients := coefficients reverse.
	newCoefficients at: 1 put: newCoefficients first + aNumber.
	^self class coefficients: newCoefficients
]

{ #category : #'double dispatching' }
PMPolynomial >> addPolynomial: aPolynomial [

	^self class coefficients: ( ( 0 to: (self degree max: aPolynomial degree)) collect: [ :n | ( aPolynomial at: n) + ( self at: n)])
]

{ #category : #information }
PMPolynomial >> at: anInteger [
	"Answers the coefficient of order anInteger."
	^anInteger < coefficients size
		ifTrue: [ coefficients at: ( coefficients size - anInteger)]
		ifFalse:[ 0]
]

{ #category : #information }
PMPolynomial >> coefficients [

	^coefficients reverse
]

{ #category : #creation }
PMPolynomial >> deflatedAt: aNumber [
	"Answers a new polynomial quotient of the receiver with polynomial (X-aNumber)"
	| remainder next newCoefficients |
	remainder := 0.
	newCoefficients := coefficients collect:
						[ :each |
						  next := remainder.
						  remainder := remainder * aNumber + each.
						  next].
	^self class coefficients: ( newCoefficients copyFrom: 2 to: newCoefficients size) reverse
]

{ #category : #information }
PMPolynomial >> degree [

	^ coefficients size - 1
]

{ #category : #creation }
PMPolynomial >> derivative [
	"Answer a new polynomial, derivative of the receiver."
	| n |
	n := coefficients size.
	^self class coefficients: ( ( coefficients collect: [ :each | n := n - 1. each * n]) reverse copyFrom: 2 to: coefficients size)
]

{ #category : #'double dispatching' }
PMPolynomial >> dividingPolynomial: aPolynomial [

	^( self dividingPolynomialWithRemainder: aPolynomial) first
]

{ #category : #'double dispatching' }
PMPolynomial >> dividingPolynomialWithRemainder: aPolynomial [

	| remainderCoefficients quotientCoefficients n m norm quotientDegree |
	n := self degree.
	m := aPolynomial degree.
	quotientDegree := m - n.
	quotientDegree < 0
		"this is a bugfix: variable sized instance : Behavior basicNew"
		ifTrue: [ ^Array with: ( self class coefficients: #(0)) with: aPolynomial].
	quotientCoefficients := Array new: quotientDegree + 1.
	remainderCoefficients := ( 0 to: m) collect: [ :k | aPolynomial at: k].
	norm := 1 / coefficients first.
	quotientDegree to: 0 by: -1
		do: [ :k | | x |
			  x := ( remainderCoefficients at: n + k + 1) * norm.
			  quotientCoefficients at: (quotientDegree + 1 - k) put: x.
			  (n + k - 1) to: k by: -1
				do: [ :j |
				remainderCoefficients at: j + 1 put:
							( ( remainderCoefficients at: j + 1) - ( x * (self at: j - k)))
				].
			].
	^Array with: ( self class coefficients: quotientCoefficients reverse)
		   with: ( self class coefficients: ( remainderCoefficients copyFrom: 1 to: n))
]

{ #category : #comparing }
PMPolynomial >> hash [
	^coefficients hash
]

{ #category : #initialization }
PMPolynomial >> initialize [
	"initialize an empty polynomial as the constant zero"
	super initialize.
	coefficients := #( 0 ).
	^ self
]

{ #category : #initialization }
PMPolynomial >> initialize: anArray [

	coefficients := anArray.
	^self
]

{ #category : #creation }
PMPolynomial >> integral [
	"Answer a new polynomial, integral of the receiver with value 0 at x=0."
	^self integral: 0
]

{ #category : #creation }
PMPolynomial >> integral: aValue [
	"Answer a new polynomial, integral of the receiver with given value at x=0."
	| n |
	n := coefficients size + 1.
	^self class coefficients: ( ( coefficients collect: [ :each | n := n - 1. each / n]) copyWith: aValue) reverse
]

{ #category : #operation }
PMPolynomial >> isZero [
	^ self coefficients allSatisfy: [:ea | ea = 0]
]

{ #category : #operation }
PMPolynomial >> negated [
	^ self * -1
]

{ #category : #printing }
PMPolynomial >> printOn: aStream [
	"Append to aStream a written representation of the receiver."

	| n firstNonZeroCoefficientPrinted |
	n := 0.
	firstNonZeroCoefficientPrinted := false.
	coefficients
		reverseDo:
			[:each |
			each = 0
				ifFalse:
					[firstNonZeroCoefficientPrinted
						ifTrue:
							[aStream space.
							((each respondsTo: #< ) and: [each < 0]) ifFalse: [aStream nextPut: $+].
							aStream space]
						ifFalse: [firstNonZeroCoefficientPrinted := true].
					(each = 1 and: [n > 0])
						ifFalse: [each printOn: aStream].
					n > 0
						ifTrue:
							[aStream nextPutAll: ' X'.
							n > 1
								ifTrue:
									[aStream nextPut: $^.
									n printOn: aStream]]].
			n := n + 1].

	"add a quick check, print a zero if the polynomial has all zero coefficients"
	firstNonZeroCoefficientPrinted ifFalse: [0 printOn: aStream]
]

{ #category : #operation }
PMPolynomial >> reciprocal [
	^ (PMPolynomial coefficients: #(1)) / self
]

{ #category : #information }
PMPolynomial >> roots [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	^ (self roots: Float defaultComparisonPrecision) asSortedCollection asArray
]

{ #category : #information }
PMPolynomial >> roots: aNumber [

	| pol roots x rootFinder |
	rootFinder := PMNewtonZeroFinder with: aNumber.
	pol := self class coefficients:
		       (coefficients reverse collect: [ :each | each asFloat ]).
	roots := OrderedCollection new: self degree.
	[
	rootFinder
		setFunction: pol;
		setDerivative: pol derivative.
	x := rootFinder evaluate.
	rootFinder hasConverged ] whileTrue: [
		roots add: x.
		pol := pol deflatedAt: x.
		pol degree > 0 ifFalse: [ ^ roots ] ].
	^ roots
]

{ #category : #'double dispatching' }
PMPolynomial >> subtractToPolynomial: aPolynomial [

	^self class coefficients: ( ( 0 to: (self degree max: aPolynomial degree)) collect: [ :n | ( aPolynomial at: n) - ( self at: n)])
]

{ #category : #'double dispatching' }
PMPolynomial >> timesNumber: aNumber [

	^self class coefficients: ( coefficients reverse collect: [ :each | each * aNumber])
]

{ #category : #'double dispatching' }
PMPolynomial >> timesPolynomial: aPolynomial [

	| productCoefficients degree|
	degree := aPolynomial degree + self degree.
	productCoefficients := ( degree to: 0 by: -1)
			collect:[ :n | | sum |
					  sum := 0.
					  0 to: (degree - n)
						do: [ :k | sum := (self at: k) * (aPolynomial at: ( degree - n - k)) + sum].
					  sum
					].
	^self class coefficients: productCoefficients
]

{ #category : #information }
PMPolynomial >> value: aNumber [
	"Answer the value of the polynomial for the specified variable value."
	^coefficients inject: 0 into: [ :sum :each | sum * aNumber + each]
]
