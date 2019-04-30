Extension { #name : #Integer }

{ #category : #'*Math-Numerical' }
Integer >> gamma [
	self > 0
		ifFalse: [^ self error: 'Attempt to compute the Gamma function of a non-positive integer'].
	^ (self - 1) factorial.
]

{ #category : #'*Math-Numerical' }
Integer >> random [
		"Answer a random integer between 0 and the receiver."
	^ PMMitchellMooreGenerator new integerValue: self
]
