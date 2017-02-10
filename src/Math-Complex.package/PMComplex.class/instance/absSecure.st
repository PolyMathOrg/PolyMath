arithmetic
absSecure
	"Answer the distance of the receiver from zero (0 + 0 i).
	Try avoiding overflow and/or underflow"

	| scale |
	scale := real abs max: imaginary abs.
	^scale isZero 
		ifTrue: [scale]
		ifFalse: [(self class real: real / scale imaginary: imaginary / scale) squaredNorm sqrt * scale]