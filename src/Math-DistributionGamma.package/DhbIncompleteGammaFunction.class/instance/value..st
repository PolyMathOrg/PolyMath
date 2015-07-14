information
value: aNumber
		"Compute the value of the receiver for argument aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/3/99 "
	| x norm |
	aNumber = 0
		ifTrue: [ ^0].
	x := aNumber asFloat.
	norm := [ ( x ln * alpha - x - alphaLogGamma) exp] on: Error do: [ :signal | signal return: nil].
	norm isNil
		ifTrue: [ ^1].
	^x - 1 < alpha
		ifTrue: [ ( self evaluateSeries: x) * norm]
		ifFalse:[ 1 - ( norm / ( self evaluateFraction: x))]