arithmetic
abs
	"Return the magnitude (or absolute value) of the quaternion.
	Care for overflow or underflow"

	| scale |
	scale := (qr abs max: qi abs) max: (qj abs max: qk abs).
	^scale isZero 
		ifTrue: [scale]
		ifFalse: 
			[(self species 
				qr: qr / scale
				qi: qi / scale
				qj: qj / scale
				qk: qk / scale) squaredNorm sqrt * scale]