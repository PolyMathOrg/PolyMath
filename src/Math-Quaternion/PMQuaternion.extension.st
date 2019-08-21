Extension { #name : #PMQuaternion }

{ #category : #'*Math-Quaternion' }
PMQuaternion >> addPolynomial: aPolynomial [
	^aPolynomial addNumber: self
]

{ #category : #'*Math-Quaternion' }
PMQuaternion >> dividingPolynomial: aPolynomial [
	^aPolynomial timesNumber: (1 / self)
]

{ #category : #'*Math-Quaternion' }
PMQuaternion >> productWithVector: aVector [
		"Answers a new vector product of the receiver with aVector."
	^aVector collect: [ :each | each * self]
]

{ #category : #'*Math-Quaternion' }
PMQuaternion class >> random [
		"Answers a random quaternion with abs at most one."

	^ (0.5 - Float random) 
		i: (0.5 - Float random)
		j: (0.5 - Float random)
		k: (0.5 - Float random).
]

{ #category : #'*Math-Quaternion' }
PMQuaternion >> random [
	"analog to Number>>random. The resulting quaternion will have abs at most that of the receiver"
	^ self class random * self.
]

{ #category : #'*Math-Quaternion' }
PMQuaternion >> subtractToPolynomial: aPolynomial [
	^aPolynomial addNumber: self negated
]

{ #category : #'*Math-Quaternion' }
PMQuaternion >> timesPolynomial: aPolynomial [
	^aPolynomial timesNumber: self
]
