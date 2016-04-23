initialization
initialize
	super initialize.
	self generator: self class defaultGeneratorClass new.
	self probability: 0.5