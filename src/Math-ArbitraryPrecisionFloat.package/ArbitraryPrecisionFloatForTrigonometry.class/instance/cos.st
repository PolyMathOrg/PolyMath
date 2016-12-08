private
cos
	"Evaluate the cosine of the receiver"

	| halfPi quarterPi x neg |
	x := self moduloNegPiToPi.
	x inPlaceAbs.
	halfPi := pi timesTwoPower: -1.
	(neg := x > halfPi) ifTrue: [x inPlaceSubtract: pi; inPlaceNegated].
	quarterPi := halfPi timesTwoPower: -1.
	x > quarterPi
		ifTrue:
			[x inPlaceSubtract: halfPi; inPlaceNegated.
			x := self sin: x]
		ifFalse: [x := self cos: x].
	neg ifTrue: [x inPlaceNegated].
	^x asArbitraryPrecisionFloatNumBits: nBits