as yet unclassified
testNextGivesArrayOfNumbers
	RandomGenerator subclasses do:
		[:cls | | gen samples| 
		gen := cls new.
		samples := gen next: 10.
		self should: [samples size = 10].
		self should: [(samples at: 1 ) isFloat].
		self should: [samples asSet size = 10]]