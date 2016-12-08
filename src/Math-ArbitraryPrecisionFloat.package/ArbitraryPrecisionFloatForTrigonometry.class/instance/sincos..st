private
sincos: x
	"Evaluate the sine and cosine of x by recursive sin(2x) and cos(2x) formula and power series expansion.
	Note that it is better to use this method with x <= pi/4."
	
	| one sin cos sincos fraction power |
	x isZero ifTrue: [^Array with: x zero with: x one].
	power := ((nBits bitShift: -1) + x exponent max: 0) highBit.
	fraction := x timesTwoPower: power negated.
	sincos := fraction powerExpansionSinCosPrecision: nBits + (1 bitShift: 1 + power).
	sin := sincos first.
	cos := sincos last.
	one := x one.
	power timesRepeat:
		["Evaluate sin(2x)=2 sin(x) cos(x)"
		sin inPlaceMultiplyBy: cos; inPlaceTimesTwoPower: 1.
		"Evaluate cos(2x)=2 cos(x)^2-1"
		cos inPlaceMultiplyBy: cos; inPlaceTimesTwoPower: 1; inPlaceSubtract: one].
	^sincos