Extension { #name : #PMComplex }

{ #category : #'*Math-Complex' }
PMComplex >> addPolynomial: aPolynomial [
	^ aPolynomial addNumber: self
]

{ #category : #'*Math-Complex' }
PMComplex >> dividingPolynomial: aPolynomial [
	^ aPolynomial timesNumber: 1 / self
]

{ #category : #'*Math-Complex' }
PMComplex >> productWithVector: aVector [
	"Answers a new vector product of the receiver with aVector."

	^ aVector collect: [ :each | each * self ]
]

{ #category : #'*Math-Complex' }
PMComplex class >> random [
		"Answers a random number with abs between 0 and 1." 

	^ self abs: 1.0 random arg: 2 * Float pi random
]

{ #category : #'*Math-Complex' }
PMComplex >> random [
	"analog to Number>>random. However, the only bound is that the abs of the produced complex is less than the length of the receive. The receiver effectively defines a disc within which the random element can be produced."
	^ self class random * self
	
]

{ #category : #'*Math-Complex' }
PMComplex >> subtractToPolynomial: aPolynomial [
	^ aPolynomial addNumber: self negated
]

{ #category : #'*Math-Complex' }
PMComplex >> timesPolynomial: aPolynomial [
	^ aPolynomial timesNumber: self
]
