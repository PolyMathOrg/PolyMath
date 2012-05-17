instance creation
new
	^ (self basicNew) 
		generator: (self defaultGenerator new);
		lambda: 1.