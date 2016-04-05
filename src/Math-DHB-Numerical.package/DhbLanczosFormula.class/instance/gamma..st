information
gamma: aNumber
	^ (self leadingFactor: aNumber) exp * (self series: aNumber) * sqrt2Pi / aNumber