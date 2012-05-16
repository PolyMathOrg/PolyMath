information
value: aNumber
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "
	^beta / ( Float pi * ( beta squared + ( aNumber - mu) squared))