information
computePrecision
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	^self precisionOf: ( ( bestPoints at: 2) position - ( bestPoints at: 3) position) abs
		   relativeTo: ( bestPoints at: 1) position abs