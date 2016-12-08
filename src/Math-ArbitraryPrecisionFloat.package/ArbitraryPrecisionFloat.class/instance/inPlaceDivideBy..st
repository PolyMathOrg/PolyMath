private
inPlaceDivideBy: y 
	"Reference: Accelerating Correctly Rounded
	Floating-Point Division when the Divisor
	Is Known in Advance - Nicolas Brisebarre,
	Jean-Michel Muller, Member, IEEE, and
	Saurabh Kumar Raina -
	http://perso.ens-lyon.fr/jean-michel.muller/DivIEEETC-aug04.pdf"

	| zh x q |
	zh := y reciprocal reduce.
	x := self copy.
	self inPlaceMultiplyBy: zh.
	q := self copy.
	"r := "self inPlaceMultiplyBy: y negated andAccumulate: x.
	"q' := "self inPlaceMultiplyBy: zh andAccumulate: q.

	"ALGO 4
	| zh r zl |
	zh := b reciprocal.
	r := b negated inPlaceMultiplyBy: zh andAccumulate: (1 asArbitraryPrecisionFloatNumBits: nBits).
	zl := (b asArbitraryPrecisionFloatNumBits: nBits + 1) reciprocal inPlaceMultiplyBy: r.
	self inPlaceMultiplyBy: zh andAccumulate: (zl inPlaceMultiplyBy: self)"