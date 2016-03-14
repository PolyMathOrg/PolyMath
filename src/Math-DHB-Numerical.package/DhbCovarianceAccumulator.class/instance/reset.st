transformation
reset
		"Set all accumulators to zero.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 8/3/99 "
	super reset.
	covariance do: [ :each | each atAllPut: 0].