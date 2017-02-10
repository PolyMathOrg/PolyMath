private
cos: x
	"Evaluate the cosine of x by recursive cos(2x) formula and power series expansion.
	Note that it is better to use this method with x <= pi/4."
	
	| one cos fraction power |
	x isZero ifTrue: [^x one].
	power := ((nBits bitShift: -1) + x exponent max: 0) highBit.
	fraction := x timesTwoPower: power negated.
	cos := fraction powerExpansionCosPrecision: nBits + (1 bitShift: 1 + power).
	one := x one.
	power timesRepeat:
		["Evaluate cos(2x)=2 cos(x)^2-1"
		cos inPlaceMultiplyBy: cos; inPlaceTimesTwoPower: 1; inPlaceSubtract: one].
	^cos