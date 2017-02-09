information
value: aNumber

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