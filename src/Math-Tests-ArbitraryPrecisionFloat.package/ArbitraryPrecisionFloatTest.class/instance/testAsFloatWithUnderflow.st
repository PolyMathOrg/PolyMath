testing-converting
testAsFloatWithUnderflow
	| fmin fminA |
	fmin := Float fmin.
	fminA := fmin asArbitraryPrecisionFloatNumBits: one numBits.
	Float emin - Float precision + 1 to: Float emin + 1 do: [:n |
		self assert: ((one timesTwoPower: n) + fminA) asFloat = ((1.0e0 timesTwoPower: n) + fmin)].