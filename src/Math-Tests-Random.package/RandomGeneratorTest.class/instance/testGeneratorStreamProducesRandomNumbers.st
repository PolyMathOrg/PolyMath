as yet unclassified
testGeneratorStreamProducesRandomNumbers
	RandomGenerator subclasses do: 
	[:cls | | gen value |
		gen := cls new.
		value := gen next.
		self shouldnt: [gen next = value]].