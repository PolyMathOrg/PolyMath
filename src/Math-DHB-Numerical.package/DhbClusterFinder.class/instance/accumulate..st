transformation
accumulate: aVector
		"Private - Accumulate aVector into the nearest cluster.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 9/3/99 "
	( result at: ( self indexOfNearestCluster: aVector)) accumulate: aVector.