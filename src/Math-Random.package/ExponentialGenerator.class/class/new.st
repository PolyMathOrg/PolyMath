instance creation
new
	^ (self basicNew) 
		generator: (self defaultGenerator new);
		mean: 1