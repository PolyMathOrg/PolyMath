instance creation
lambda: aNumber
	^ self basicNew
		generator: self defaultGeneratorClass new;
		lambda: aNumber; 
		yourself