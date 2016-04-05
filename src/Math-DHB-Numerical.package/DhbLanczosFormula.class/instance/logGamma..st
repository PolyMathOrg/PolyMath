information
logGamma: aNumber
	^ (self leadingFactor: aNumber) + ((self series: aNumber) * sqrt2Pi / aNumber) ln