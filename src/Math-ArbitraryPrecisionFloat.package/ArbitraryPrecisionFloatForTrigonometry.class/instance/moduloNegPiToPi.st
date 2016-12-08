private
moduloNegPiToPi
	"answer a copy of the receiver modulo 2*pi, with doubled precision"

	| x quo twoPi |
	x := (ArbitraryPrecisionFloat
		mantissa: mantissa abs
		exponent: biasedExponent
		nBits: nBits * 2 + 16).
	pi := x pi.
	twoPi := pi timesTwoPower: 1.
	x > pi ifTrue:
		[quo := x + pi quo: twoPi.
		quo highBit * 2 > nBits ifTrue:
			[x := (ArbitraryPrecisionFloat
				mantissa: mantissa abs
				exponent: biasedExponent
				nBits: nBits * 3 // 2 + quo highBit + 16).
			pi := x pi.
			twoPi := pi timesTwoPower: 1.
			quo := x + pi quo: twoPi].
		x inPlaceSubtract: twoPi * quo].
	self negative ifTrue: [x inPlaceNegated].
	^x asArbitraryPrecisionFloatNumBits: nBits * 2 + 16