initialization
computeNorm
		"Private - Compute the norm of the receiver because its parameters have changed.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "
	norm := ( ( degreeOfFreedom / 2 logBeta: ( 1 / 2) ) + ( degreeOfFreedom ln / 2)) negated.