information
value: aNumber
	"Answers the probability that a random variable distributed according to the receiver gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	
	^( PMErfApproximation new normal: (aNumber - mu) / sigma) / sigma