transformation
pivotStepAt: anInteger
		"Private - Performs an optimum pivot operation at anInteger.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "
	self swapRow: anInteger withRow: ( self largestPivotFrom: anInteger);
		   pivotAt: anInteger.