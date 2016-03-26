accessing
testGeneratorStreamIsReadOnly
	RandomGenerator subclasses
		do: [ :cls | 
			| gen |
			gen := cls new.
			self shouldnt: [ gen isWriteable ].
			self assert: gen isReadable ]