as yet unclassified
testGeneratorStreamIsReadOnly
	RandomGenerator subclasses do:
		[:cls | |gen|
		gen := cls new.
		self shouldnt: [gen isWriteable].
		self should: [gen isReadable]]