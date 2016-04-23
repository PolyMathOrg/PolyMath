tests
testGeneratorStreamPeekIsNext
	PMRandomGenerator subclasses
		do: [ :cls | 
			| gen value |
			gen := cls new.
			value := gen peek.
			self assert: gen peek equals: value.
			self assert: gen next equals: value ]