tests
testGeneratorStreamProducesRandomNumbers
	PMRandomGenerator subclasses do: 
	[:cls | | gen value |
		gen := cls new.
		value := gen next.
		self shouldnt: [gen next = value]].