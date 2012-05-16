mathematical functions
ln
	"Answer the receiver natural logarithm"

	| z |
	z := self unreal abs.
	^z isZero 
		ifTrue: 
			[self species 
				qr: self abs ln
				qi: (z arcTan: qr)
				qj: 0
				qk: 0]
		ifFalse: 
			[| theta |
			theta := (z arcTan: qr) / z.
			self species 
				qr: self abs ln
				qi: qi * theta
				qj: qj * theta
				qk: qk * theta]