Extension { #name : #Number }

{ #category : #'*Math-Complex' }
Number >> adaptToComplex: rcvr andSend: selector [
	"If I am involved in arithmetic with a Complex number, convert me to a Complex number."
	^ rcvr perform: selector with: self asComplex
]

{ #category : #'*Math-Complex' }
Number >> asComplex [
	"Answer a Complex number that represents value of the receiver."

	^ PMComplex real: self imaginary: 0
]

{ #category : #'*Math-Complex' }
Number >> complexConjugate [
	^ self.
]

{ #category : #'*Math-Complex' }
Number >> i [
	^ PMComplex real: 0 imaginary: self
]

{ #category : #'*Math-Complex' }
Number >> i: aNumber [
	"Form a complex number with
		receiver as realPart
		aNumber as imaginaryPart
	this is the same as (self + aNumber i) but a little bit more efficient."

	aNumber isNumber ifFalse: [self error: 'Badly formed complex number'].
	^PMComplex real: self imaginary: aNumber
]

{ #category : #'*Math-Complex' }
Number >> isComplexConjugateOf: aNumber [
	"A complex conjugate of a real number is same real number"
	^ self = aNumber
]

{ #category : #'*Math-Complex' }
Number >> isComplexConjugateOfAComplexNumber: aComplexNumber [
	"A complex conjugate of a real number is same real number"
	^ self isComplexConjugateOf: aComplexNumber
]

{ #category : #'*Math-Complex' }
Number >> isRealNumber [
	"Answer true if receiver is a real number. All instances of Number are real numbers."
	^ true
]
