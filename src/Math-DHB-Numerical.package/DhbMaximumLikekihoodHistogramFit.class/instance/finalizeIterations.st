operation
finalizeIterations
	"Compute the normalization factor.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 9/3/99 "

	self computeNormalization.
	result setCount: count.
	super finalizeIterations