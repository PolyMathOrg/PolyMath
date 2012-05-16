information
inverseAcceptanceAfterPeak: aNumber
		"Private - Compute inverse acceptance function in the region after the peak.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 4/3/99 "
	^ highLimit - ( ( ( 1 - aNumber) * ( highLimit - lowLimit) * ( highLimit - peak)) sqrt)