testing-converting
testAsMinimalDecimalFraction
	| emax emin leadingOne significands |
	significands := 0 to: 1<<10-1.
	leadingOne := 1<<10.
	emin := -14.
	emax := 15.
	
	"Test all normal finite half precision float"
	emin to: emax do: [:e | 
		significands do: [:s |
			| f |
			f := (leadingOne + s asArbitraryPrecisionFloatNumBits: 11) timesTwoPower: e - 10.
			self assert: (f asMinimalDecimalFraction asArbitraryPrecisionFloatNumBits: 11) = f]].
	
	"Test all subnormal finite half precision float"
	significands do: [:s |
		| f |
		f := (s asArbitraryPrecisionFloatNumBits: s highBit) timesTwoPower: emin - 10.
		self assert: (f asMinimalDecimalFraction asArbitraryPrecisionFloatNumBits: s highBit) = f].