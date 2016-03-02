information
distributionValue: aNumber
	"Answers the probability of observing a random variable distributed according to the receiver with a value lower than or equal to aNumber."
	^1 - ( self incompleteBetaFunction value: ( dof2 / ( aNumber * dof1 + dof2)))