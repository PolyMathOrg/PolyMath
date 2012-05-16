information
inverseAcceptanceBeforePeak: aNumber
		"Private - Compute inverse acceptance function in the region before the peak.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 4/3/99 "
	^ ( aNumber * ( highLimit - lowLimit) * ( peak - lowLimit)) sqrt + lowLimit