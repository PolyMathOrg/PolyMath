instance creation
withProbability: p
	self validProbability: p.
	^ (self new) p: p.