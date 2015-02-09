*ArbitraryPrecisionFloat
asArbitraryPrecisionFloatNumBits: n 
	"Answer a Floating point with arbitrary precision
	close to the receiver."

	"Note: form below would not be the closest approximation
	^ (numerator asArbitraryPrecisionFloatNumBits: n)
		inPlaceDivideBy: (denominator asArbitraryPrecisionFloatNumBits: n)"

	| a b mantissa exponent nBits ha hb hm hasTruncatedBits |
	a := numerator abs.
	b := denominator abs.
	ha := a highBit.
	hb := b highBit.

	"If both numerator and denominator are represented exactly in floating point number,
	then fastest thing to do is to use hardwired float division"
	nBits := n + 1.
	(ha < nBits and: [hb < nBits]) 
		ifTrue: 
			[^(numerator asArbitraryPrecisionFloatNumBits: n) 
				inPlaceDivideBy: (denominator asArbitraryPrecisionFloatNumBits: n)].

	"Shift the fraction by a power of two exponent so as to obtain a mantissa with n+1 bits.
	First guess is rough, the mantissa might have n+2 bits."
	exponent := ha - hb - nBits.
	exponent > 0 
		ifTrue: [b := b bitShift: exponent]
		ifFalse: [a := a bitShift: exponent negated].
	mantissa := a quo: b.
	hasTruncatedBits := a > (mantissa * b).
	hm := mantissa highBit.

	"Remove excess bits in the mantissa."
	hm > nBits 
		ifTrue: 
			[exponent := exponent + hm - nBits.
			hasTruncatedBits := hasTruncatedBits or: [mantissa anyBitOfMagnitudeFrom: 1 to: hm - nBits].
			mantissa := mantissa bitShift: nBits - hm].

	"Check if mantissa must be rounded upward.
	The case of tie (mantissa odd & hasTruncatedBits not)
	will be handled by Integer>>asArbitraryPrecisionFloatNumBits:."
	(hasTruncatedBits and: [mantissa odd])
		ifTrue: [mantissa := mantissa + 1].

	"build the ArbitraryPrecisionFloat from mantissa and exponent"
	^(self positive 
		ifTrue: [mantissa asArbitraryPrecisionFloatNumBits: n]
		ifFalse: [mantissa negated asArbitraryPrecisionFloatNumBits: n]) 
			inPlaceTimesTwoPower: exponent