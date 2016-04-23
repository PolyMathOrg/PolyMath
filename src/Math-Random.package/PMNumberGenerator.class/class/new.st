instance-creation
new
	^ (self basicNew
		generator: self defaultGeneratorClass new)
		initialize;
		yourself