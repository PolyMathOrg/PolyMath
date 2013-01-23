as yet unclassified
testGeneratorStreamNeverEnds
	RandomGenerator subclasses do: 
	[:cls | | gen |
		gen := cls new.
		self shouldnt: [gen atEnd]].