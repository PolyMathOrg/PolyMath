private
pi
	"Answer an approximation of pi with doubled precision."

	^pi ifNil: [ pi := (ArbitraryPrecisionFloat
		mantissa: 0
		exponent: 0
		nBits: nBits * 2 + 2) pi ]