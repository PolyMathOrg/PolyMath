information
valueAndGradient: aNumber
	"Answers an Array containing the value of the receiver at aNumber
	 and the gradient of the receiver's respective to the receiver's
	 parameters evaluated at aNumber."
	^self approximatedValueAndGradient: aNumber