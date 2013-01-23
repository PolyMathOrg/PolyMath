as yet unclassified
testGeneratorStreamProducesNumbers
	RandomGenerator subclasses do: 
	[:cls | | gen |
		gen := cls new.
		self should: [gen next isNumber].
		self should: [gen next isFloat]].