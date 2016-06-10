information
defaultDerivativeBlock
	"Private - Answers a block computing the function's derivative by approximation."
	^[ :x | 5000 * ( ( functionBlock value: (x + 0.0001)) - ( functionBlock value: (x - 0.0001)))]