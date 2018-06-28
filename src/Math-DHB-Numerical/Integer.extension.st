Extension { #name : #Integer }

{ #category : #'*Math-DHB-Numerical' }
Integer >> gamma [
	self > 0
		ifFalse: [^ self error: 'Attempt to compute the Gamma function of a non-positive integer'].
	^ (self - 1) factorial.
]

{ #category : #'*Math-DHB-Numerical' }
Integer >> random [
		"Answer a random integer between 0 and the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^ PMMitchellMooreGenerator new integerValue: self
]
