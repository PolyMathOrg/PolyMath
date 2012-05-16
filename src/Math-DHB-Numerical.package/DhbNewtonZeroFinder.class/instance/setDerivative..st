initialization
setDerivative: aBlock 
	"Defines the derivative of the function for which zeroes will be found. 
	(c) Copyrights Didier BESSET, 1999, all rights reserved. 
	Initial code: 7/1/99"

	| x |
	(aBlock respondsTo: #value:)
		ifFalse: [self error: 'Derivative block must implement the method value:'].
	x := result isNil
				ifTrue: [Number random]
				ifFalse: [result + Number random].
	((aBlock value: x)
		relativelyEqualsTo: (self defaultDerivativeBlock value: x)
		upTo: 1.0e-4)
		ifFalse: [self error: 'Supplied derivative is not correct'].
	derivativeBlock := aBlock