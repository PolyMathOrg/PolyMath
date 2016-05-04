information
computePrecision
	^self precisionOf: ( ( bestPoints at: 2) position - ( bestPoints at: 3) position) abs
		   relativeTo: ( bestPoints at: 1) position abs