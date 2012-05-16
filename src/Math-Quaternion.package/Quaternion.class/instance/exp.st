mathematical functions
exp
	"Answer the receiver exponential"

	| z w |
	z := self unreal abs.
	w := z isZero
		ifTrue: [z]
		ifFalse: [z sin / z].
	^qr exp * (self species 
				qr: z cos
				qi: qi * w
				qj: qj * w
				qk: qk * w)