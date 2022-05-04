Extension { #name : #PMComplexNumber }

{ #category : #'*Math-Complex' }
PMComplexNumber >> addPolynomial: aPolynomial [
	^ aPolynomial addNumber: self
]

{ #category : #'*Math-Complex' }
PMComplexNumber >> dividingPolynomial: aPolynomial [
	^ aPolynomial timesNumber: 1 / self
]

{ #category : #'*Math-Complex' }
PMComplexNumber >> productWithVector: aVector [
	"Answers a new vector product of the receiver with aVector."

	^ aVector collect: [ :each | each * self ]
]

{ #category : #'*Math-Complex' }
PMComplexNumber >> random [
	"analog to Number>>random. However, the only bound is that the abs of the produced complex is less than the length of the receive. The receiver effectively defines a disc within which the random element can be produced."
	^ self class random * self
	
]

{ #category : #'*Math-Complex' }
PMComplexNumber class >> random [
	"Answers a random number with abs between 0 and 1." 
	| random |
	random := Random new.
	
	^ self
		abs: random next
		arg: 2 * (random nextBetween: 0 and: Float pi)
]

{ #category : #'*Math-Complex' }
PMComplexNumber >> subtractToPolynomial: aPolynomial [
	^ aPolynomial addNumber: self negated
]

{ #category : #'*Math-Complex' }
PMComplexNumber >> timesPolynomial: aPolynomial [
	^ aPolynomial timesNumber: self
]
