instance creation
mean: aNumber
	^ self basicNew 
		generator: self defaultGeneratorClass new;
		mean: aNumber;
		yourself