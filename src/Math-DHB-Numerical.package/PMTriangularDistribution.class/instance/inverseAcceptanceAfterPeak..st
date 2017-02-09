information
inverseAcceptanceAfterPeak: aNumber
		"Private - Compute inverse acceptance function in the region after the peak."
	^ highLimit - ( ( ( 1 - aNumber) * ( highLimit - lowLimit) * ( highLimit - peak)) sqrt)