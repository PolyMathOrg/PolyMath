information
at: anInteger
	"Answers the coefficient of order anInteger."
	^anInteger < coefficients size
		ifTrue: [ coefficients at: ( coefficients size - anInteger)]
		ifFalse:[ 0]