accessing
testGeneratorStreamProducesNumbers
	RandomGenerator subclasses
		do: [ :cls | 
			| gen |
			gen := cls new.
			self assert: gen next isNumber.
			self assert: gen next isFloat ]