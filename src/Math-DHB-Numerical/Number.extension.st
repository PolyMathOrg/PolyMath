Extension { #name : #Number }

{ #category : #'*Math-DHB-Numerical' }
Number >> addPolynomial: aPolynomial [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 19/4/99 "
	^aPolynomial addNumber: self
]

{ #category : #'*Math-DHB-Numerical' }
Number >> beta: aNumber [
	"Computes the beta function of the receiver and aNumber"

	^ (self logBeta: aNumber) exp
]

{ #category : #'*Math-DHB-Numerical' }
Number >> dividingPolynomial: aPolynomial [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/4/99 "
	^aPolynomial timesNumber: (1 / self)
]

{ #category : #'*Math-DHB-Numerical' }
Number >> equalsTo: aNumber [
		"compare to Float>>closeTo:"
	^self relativelyEqualsTo: aNumber upTo: PMFloatingPointMachine new defaultNumericalPrecision
]

{ #category : #'*Math-DHB-Numerical' }
Number >> errorFunction [
		"Answer the error function for the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^ PMErfApproximation new value: self
]

{ #category : #'*Math-DHB-Numerical' }
Number >> gamma [
		"Compute the Gamma function for the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^ self > 1
		ifTrue: [ ^ PMLanczosFormula new gamma: self]
		ifFalse:[ self < 0
						ifTrue: [ Float pi / ( ( Float pi * self) sin * ( 1 - self) gamma)]
						ifFalse:[ ( PMLanczosFormula new gamma: ( self + 1)) / self]
					]
]

{ #category : #'*Math-DHB-Numerical' }
Number >> logBeta: aNumber [
	"Computes the logarithm of the beta function of the receiver and aNumber"

	^ self logGamma + aNumber logGamma - (self + aNumber) logGamma
]

{ #category : #'*Math-DHB-Numerical' }
Number >> logGamma [
		"Computes the log of the Gamma function (for positive numbers only)"
	^self > 1
		ifTrue: [ PMLanczosFormula new logGamma: self]
		ifFalse:[ self > 0
						ifTrue: [ ( PMLanczosFormula new logGamma: ( self + 1) ) - self ln ]
						ifFalse: [ ^self error: 'Argument for the log gamma function must be positive']
					]
]

{ #category : #'*Math-DHB-Numerical' }
Number >> productWithMatrix: aMatrix [
^aMatrix class rows: (aMatrix rowsCollect: [:r| self productWithVector: r])
]

{ #category : #'*Math-DHB-Numerical' }
Number >> productWithVector: aVector [
		"Answers a new vector product of the receiver with aVector.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^aVector collect: [ :each | each * self]
]

{ #category : #'*Math-DHB-Numerical' }
Number >> random [
		"Answers a random number distributed between 0 and the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/2/99 "
	^self class random * self
]

{ #category : #'*Math-DHB-Numerical' }
Number class >> random [
		"Answers a random number between 0 and the receiver
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/2/99 "
	^ PMMitchellMooreGenerator new floatValue
]

{ #category : #'*Math-DHB-Numerical' }
Number >> relativelyEqualsTo: aNumber upTo: aSmallNumber [
		"compare to Float>>closeTo:
		generally called from Number>>equalsTo:"
	| norm |
	norm := self abs max: aNumber abs.
	^norm <= PMFloatingPointMachine new defaultNumericalPrecision
		or: [ (self - aNumber) abs < ( aSmallNumber * norm)]
]

{ #category : #'*Math-DHB-Numerical' }
Number >> subtractToPolynomial: aPolynomial [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 19/4/99 "
	^aPolynomial addNumber: self negated
]

{ #category : #'*Math-DHB-Numerical' }
Number >> timesPolynomial: aPolynomial [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/4/99 "
	^aPolynomial timesNumber: self
]
