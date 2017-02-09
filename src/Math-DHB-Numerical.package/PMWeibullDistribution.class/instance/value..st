information
value: aNumber
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	^( ( aNumber / beta) raisedTo: alpha) negated exp * ( aNumber raisedTo: ( alpha - 1)) * norm