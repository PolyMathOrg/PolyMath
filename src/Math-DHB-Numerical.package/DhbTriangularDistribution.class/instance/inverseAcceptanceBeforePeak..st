information
inverseAcceptanceBeforePeak: aNumber
		"Private - Compute inverse acceptance function in the region before the peak."
	^ ( aNumber * ( highLimit - lowLimit) * ( peak - lowLimit)) sqrt + lowLimit