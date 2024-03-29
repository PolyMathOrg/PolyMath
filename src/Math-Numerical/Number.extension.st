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

	self
		deprecated: 'Use closeTo: instead'
		transformWith: '`@rec equalsTo: `@arg' -> '`@rec closeTo: `@arg'.

	^ self closeTo: aNumber
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
Number >> subtractToPolynomial: aPolynomial [
	^aPolynomial addNumber: self negated
]

{ #category : #'*Math-Numerical' }
Number >> timesPolynomial: aPolynomial [
	^aPolynomial timesNumber: self
]
