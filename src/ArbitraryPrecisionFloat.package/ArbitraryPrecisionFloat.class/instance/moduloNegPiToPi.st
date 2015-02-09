private
moduloNegPiToPi
	"answer a copy of the receiver modulo 2*pi, with doubled precision"

	| x pi twoPi quo |
	x := (self asArbitraryPrecisionFloatNumBits: nBits * 2).
	self negative ifTrue: [x inPlaceNegated].
	pi := x pi.
	twoPi := pi timesTwoPower: 1.
	x > pi ifTrue:
		[quo := x + pi quo: twoPi.
		quo highBitOfMagnitude > nBits ifTrue:
			[x := (self abs asArbitraryPrecisionFloatNumBits: nBits + quo highBitOfMagnitude).
			pi := x pi.
			twoPi := pi timesTwoPower: 1.
			quo := x + pi quo: twoPi].
		x inPlaceSubtract: twoPi * quo.
		self negative ifTrue: [x inPlaceNegated]].
	^x asArbitraryPrecisionFloatNumBits: nBits * 2