accessing
testNextGivesArrayOfNumbers
	RandomGenerator subclasses
		do: [ :cls | 
			| gen samples |
			gen := cls new.
			samples := gen next: 10.
			self assert: samples size equals: 10.
			self assert: (samples at: 1) isFloat.
			self assert: samples asSet size equals: 10 ]