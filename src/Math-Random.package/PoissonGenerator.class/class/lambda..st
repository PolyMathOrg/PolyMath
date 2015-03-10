instance creation
lambda: aNumber
	^ self basicNew
		generator: self defaultGenerator new;
		lambda: aNumber