tests
testGeneratorStreamDoesntRespondToContents
	PMRandomGenerator subclasses do: 
	[:cls | | gen value |
		gen := cls new.
		self should: [gen contents] raise: Error].