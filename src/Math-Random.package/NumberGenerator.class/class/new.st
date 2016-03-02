instance-creation
new
	^ (self basicNew
		generator: self defaultGenerator new)
		initialize;
		yourself