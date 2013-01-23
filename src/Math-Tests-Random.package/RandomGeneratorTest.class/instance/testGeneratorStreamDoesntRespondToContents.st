as yet unclassified
testGeneratorStreamDoesntRespondToContents
	RandomGenerator subclasses do: 
	[:cls | | gen value |
		gen := cls new.
		self should: [gen contents] raise: Error].