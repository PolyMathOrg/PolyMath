information
valueAndGradient: aNumber
	"Answers an Array containing the value of the receiver at aNumber and the gradient of the receiver's respective to the receiver's parameters evaluated at aNumber."
	| dp y |
	y := ( aNumber - mu) / sigma.
	dp := ( PMErfApproximation new normal: y) / sigma.
	^Array with: dp
		   with: ( PMVector with: dp * y / sigma
							 with: dp * ( y squared - 1) / sigma)