information
valueAndGradient: aNumber
		"Answers an Array containing the value of the receiver at aNumber
		 and the gradient of the receiver's respective to the receiver's
		 parameters evaluated at aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/3/99 "
	| dp y |
	y := ( aNumber - mu) / sigma.
	dp := ( DhbErfApproximation new normal: y) / sigma.
	^Array with: dp
		   with: ( DhbVector with: dp * y / sigma
							 with: dp * ( y squared - 1) / sigma)