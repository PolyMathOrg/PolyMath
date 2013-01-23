as yet unclassified
testGeneratorStreamPeekIsNext
	RandomGenerator subclasses do: 
	[:cls | | gen value |
		gen := cls new.
		value := gen peek.
		self should: [gen peek = value].
		self should: [gen next = value]].