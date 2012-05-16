information
valueAndGradient: aNumber
		"Answers an Array containing the value of the receiver at aNumber
		 and the gradient of the receiver's respective to the receiver's
		 parameters evaluated at aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	| dp dy y|
	dp := self value: aNumber.
	y := ( aNumber - alpha) / beta.
	dy := ( y negated exp - 1).
	^Array with: dp
		   with: ( DhbVector with: dy * dp / beta negated
							 with: dp * ( y * dy + 1) / beta negated)