information
defaultDerivativeBlock
		"Private - Answers a block computing the function's derivative by approximation.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 7/1/99 "
	^[ :x | 5000 * ( ( functionBlock value: (x + 0.0001)) - ( functionBlock value: (x - 0.0001)))]