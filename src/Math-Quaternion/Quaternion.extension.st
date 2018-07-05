Extension { #name : #Quaternion }

{ #category : #'*Math-Quaternion' }
Quaternion >> addPolynomial: aPolynomial [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 19/4/99
		
		added to Quaternion 11 May 2012 Daniel Uber
		 "
	^aPolynomial addNumber: self
]

{ #category : #'*Math-Quaternion' }
Quaternion >> dividingPolynomial: aPolynomial [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/4/99 "
	^aPolynomial timesNumber: (1 / self)
]

{ #category : #'*Math-Quaternion' }
Quaternion >> productWithVector: aVector [
		"Answers a new vector product of the receiver with aVector.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^aVector collect: [ :each | each * self]
]

{ #category : #'*Math-Quaternion' }
Quaternion >> random [
	"analog to Number>>random. The resulting quaternion will have abs at most that of the receiver"
	^ self class random * self.
]

{ #category : #'*Math-Quaternion' }
Quaternion class >> random [
		"Answers a random quaternion with abs at most one."

	^ (0.5 - Float random) 
		i: (0.5 - Float random)
		j: (0.5 - Float random)
		k: (0.5 - Float random).
]

{ #category : #'*Math-Quaternion' }
Quaternion >> subtractToPolynomial: aPolynomial [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 19/4/99 "
	^aPolynomial addNumber: self negated
]

{ #category : #'*Math-Quaternion' }
Quaternion >> timesPolynomial: aPolynomial [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/4/99 
		added to Complex class 12 May 2012, Daniel Uber
		"
	^aPolynomial timesNumber: self
]
