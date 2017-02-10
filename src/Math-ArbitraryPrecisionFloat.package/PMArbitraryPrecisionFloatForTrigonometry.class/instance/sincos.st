private
sincos
	"Evaluate the sine and cosine of the receiver"

	| halfPi quarterPi x sincos sinneg cosneg |
	x := self moduloNegPiToPi.
	sinneg := x negative.
	x inPlaceAbs.
	halfPi := pi timesTwoPower: -1.
	(cosneg := x > halfPi) ifTrue: [x inPlaceSubtract: pi; inPlaceNegated].
	quarterPi := halfPi timesTwoPower: -1.
	x > quarterPi
		ifTrue:
			[x inPlaceSubtract: halfPi; inPlaceNegated.
			sincos := (self sincos: x) reversed]
		ifFalse:
			[sincos := self sincos: x].
	sinneg ifTrue: [sincos first inPlaceNegated].
	cosneg ifTrue: [sincos last inPlaceNegated].
	^sincos collect: [:e | e asArbitraryPrecisionFloatNumBits: nBits]