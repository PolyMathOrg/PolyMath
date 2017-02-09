operation
finalizeIterations
	"Compute the normalization factor."

	self computeNormalization.
	result setCount: count.
	super finalizeIterations