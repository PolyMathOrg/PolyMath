tests
testGeneratorStreamIsReadOnly
	PMRandomGenerator subclasses
		do: [ :cls | 
			| gen |
			gen := cls new.
			self shouldnt: [ gen isWriteable ].
			self assert: gen isReadable ]