mathematical functions
arcTan
	"Answer the arc tangent of the receiver.
	This is the inverse function of tan."

	| r2 |
	r2 := self squaredNorm.
	^self class
		real: (real * 2 arcTan: 1 - r2) / 2
		imaginary: ((r2 + (imaginary * 2) + 1) / (r2 - (imaginary * 2) + 1)) ln / 4