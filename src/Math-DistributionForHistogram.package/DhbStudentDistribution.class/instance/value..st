information
value: aNumber
	"Answers the probability that a random variable distributed according to the receiver gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	^( norm - ( ( aNumber squared / degreeOfFreedom + 1) ln * ( ( degreeOfFreedom + 1) / 2))) exp