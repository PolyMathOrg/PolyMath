information
at: anInteger
		"Answers the coefficient of order anInteger.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/4/99 "
	^anInteger < coefficients size
		ifTrue: [ coefficients at: ( coefficients size - anInteger)]
		ifFalse:[ 0]