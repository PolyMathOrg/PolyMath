information
valueAndGradient: aNumber
		"Answers an Array containing the value of the receiver at aNumber
		 and the gradient of the receiver's respective to the receiver's
		 parameters evaluated at aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	| dp denominator |
	dp := self value: aNumber.
	denominator := 1 / ( ( aNumber - mu) squared + beta squared).
	^Array with: dp
		   with: ( DhbVector with: 2 * dp * ( aNumber - mu) * denominator
							 with: dp * ( 1 / beta - ( 2 * beta * denominator)))