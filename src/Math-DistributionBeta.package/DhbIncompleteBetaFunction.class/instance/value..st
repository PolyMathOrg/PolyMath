information
value: aNumber
		"Compute the value of the receiver for argument aNumber.
		 Note: aNumber must be between 0 and 1 (otherwise an exception will occur)
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/3/99 "
	| norm |
	aNumber = 0
		ifTrue: [ ^0].
	aNumber = 1
		ifTrue: [ ^1].
	norm :=  ( aNumber ln * alpha1 + ( ( 1 - aNumber) ln * alpha2) + logNorm) exp.
	^( alpha1 + alpha2 + 2) * aNumber < ( alpha1 + 1)
		ifTrue: [ norm / ( ( self evaluateFraction: aNumber) * alpha1)]
		ifFalse:[ 1 - ( norm / ( ( self evaluateInverseFraction: aNumber) * alpha2))]