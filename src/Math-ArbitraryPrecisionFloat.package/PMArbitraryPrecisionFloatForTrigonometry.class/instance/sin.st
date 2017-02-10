private
sin
	"Evaluate the sine of the receiver"

	| halfPi quarterPi x neg |
	x := self moduloNegPiToPi.
	neg := x negative.
	x inPlaceAbs.
	halfPi := pi timesTwoPower: -1.
	x > halfPi ifTrue: [x inPlaceSubtract: pi; inPlaceNegated].
	quarterPi := halfPi timesTwoPower: -1.
	x > quarterPi
		ifTrue:
			[x inPlaceSubtract: halfPi; inPlaceNegated.
			x := self cos: x]
		ifFalse: [x := self sin: x].
	neg ifTrue: [x inPlaceNegated].
	^x asArbitraryPrecisionFloatNumBits: nBits