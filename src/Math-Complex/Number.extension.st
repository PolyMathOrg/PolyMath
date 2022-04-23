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
	"The complex conjugate of a complex number (a + bi) is another complex number (a - bi).
	Every real number x is also a complex number with imaginary part equal to 0.
	In other words, x = x + 0i and x = x - 0i.
	Therefore, the complex conjugate of a real number is the same real number"
	
	^ self
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
	self
		deprecated: 'This method is redundant. Just check the equality with complexConjugate'
		transformWith: '`@rec isComplexConjugate: `@arg' -> '`@rec complexConjugate = `@arg'.

	^ self complexConjugate = aNumber
]

{ #category : #'*Math-Complex' }
Number >> isRealNumber [
	"Answer true if receiver is a real number. All instances of Number are real numbers."
	^ true
]
