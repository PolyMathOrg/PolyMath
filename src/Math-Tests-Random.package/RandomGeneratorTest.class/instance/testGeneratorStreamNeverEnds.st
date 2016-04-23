tests
testGeneratorStreamNeverEnds
	PMRandomGenerator subclasses do: 
	[:cls | | gen |
		gen := cls new.
		self shouldnt: [gen atEnd]].