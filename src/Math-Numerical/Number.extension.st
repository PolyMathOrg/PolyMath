Extension { #name : #Number }

{ #category : #'*Math-Numerical' }
Number >> addPolynomial: aPolynomial [
	^aPolynomial addNumber: self
]

{ #category : #'*Math-Numerical' }
Number >> beta: aNumber [
	"Computes the beta function of the receiver and aNumber"

	^ (self logBeta: aNumber) exp
]

{ #category : #'*Math-Numerical' }
Number >> dividingPolynomial: aPolynomial [
	^aPolynomial timesNumber: (1 / self)
]

{ #category : #'*Math-Numerical' }
Number >> equalsTo: aNumber [
		"compare to Float>>closeTo:"
	^self relativelyEqualsTo: aNumber upTo: PMFloatingPointMachine new defaultNumericalPrecision
]

{ #category : #'*Math-Numerical' }
Number >> errorFunction [
		"Answer the error function for the receiver."
	^ PMErfApproximation new value: self
]

{ #category : #'*Math-Numerical' }
Number >> gamma [
		"Compute the Gamma function for the receiver."
	^ self > 1
		ifTrue: [ ^ PMLanczosFormula new gamma: self]
		ifFalse:[ self < 0
						ifTrue: [ Float pi / ( ( Float pi * self) sin * ( 1 - self) gamma)]
						ifFalse:[ ( PMLanczosFormula new gamma: ( self + 1)) / self]
					]
]

{ #category : #'*Math-Numerical' }
Number >> logBeta: aNumber [
	"Computes the logarithm of the beta function of the receiver and aNumber"

	^ self logGamma + aNumber logGamma - (self + aNumber) logGamma
]

{ #category : #'*Math-Numerical' }
Number >> logGamma [
		"Computes the log of the Gamma function (for positive numbers only)"
	^self > 1
		ifTrue: [ PMLanczosFormula new logGamma: self]
		ifFalse:[ self > 0
						ifTrue: [ ( PMLanczosFormula new logGamma: ( self + 1) ) - self ln ]
						ifFalse: [ ^self error: 'Argument for the log gamma function must be positive']
					]
]

{ #category : #'*Math-Numerical' }
Number >> productWithMatrix: aMatrix [
^aMatrix class rows: (aMatrix rowsCollect: [:r| self productWithVector: r])
]

{ #category : #'*Math-Numerical' }
Number >> productWithVector: aVector [
		"Answers a new vector product of the receiver with aVector."
	^aVector collect: [ :each | each * self]
]

{ #category : #'*Math-Numerical' }
Number >> random [
		"Answers a random number distributed between 0 and the receiver."
	^self class random * self
]

{ #category : #'*Math-Numerical' }
Number class >> random [
		"Answers a random number between 0 and the receiver."
	^ PMMitchellMooreGenerator new floatValue
]

{ #category : #'*Math-Numerical' }
Number >> relativelyEqualsTo: aNumber upTo: aSmallNumber [
		"compare to Float>>closeTo:
		generally called from Number>>equalsTo:"
	| norm |
	norm := self abs max: aNumber abs.
	^norm <= PMFloatingPointMachine new defaultNumericalPrecision
		or: [ (self - aNumber) abs < ( aSmallNumber * norm)]
]

{ #category : #'*Math-Numerical' }
Number >> subtractToPolynomial: aPolynomial [
	^aPolynomial addNumber: self negated
]

{ #category : #'*Math-Numerical' }
Number >> timesPolynomial: aPolynomial [
	^aPolynomial timesNumber: self
]
