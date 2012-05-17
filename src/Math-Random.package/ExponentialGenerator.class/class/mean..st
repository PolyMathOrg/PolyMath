instance creation
mean: aNumber
	^ (self basicNew) 
		generator: (self defaultGenerator new);
		mean: aNumber.