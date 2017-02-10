private
tan
	"Evaluate the tangent of the receiver"

	| halfPi quarterPi x sincos neg tan |
	x := self moduloNegPiToPi.
	neg := x negative.
	x inPlaceAbs.
	halfPi := pi timesTwoPower: -1.
	(x > halfPi)
		ifTrue:
			[x inPlaceSubtract: pi; inPlaceNegated.
			neg := neg not].
	x exponent * -4 >= nBits
		ifTrue: [tan := x powerExpansionTanPrecision: x numBits]
		ifFalse:
			[quarterPi := halfPi timesTwoPower: -1.
			x > quarterPi
				ifTrue:
					[x inPlaceSubtract: halfPi; inPlaceNegated.
					sincos := (self sincos: x) reversed]
				ifFalse:
					[sincos := self sincos: x].
			sincos first inPlaceDivideBy: sincos last.
			tan := sincos first].
	neg ifTrue: [tan inPlaceNegated].
	^tan asArbitraryPrecisionFloatNumBits: nBits