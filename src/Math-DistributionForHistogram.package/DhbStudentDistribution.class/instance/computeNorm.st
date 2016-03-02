private
computeNorm
	"Private - Compute the norm of the receiver because its parameters have changed."
	norm := ( ( degreeOfFreedom / 2 logBeta: ( 1 / 2) ) + ( degreeOfFreedom ln / 2)) negated.