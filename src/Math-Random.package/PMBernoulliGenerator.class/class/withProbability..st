instance creation
withProbability: p
	self validProbability: p.
	^ self new probability: p