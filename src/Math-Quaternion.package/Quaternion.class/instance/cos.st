mathematical functions
cos
	"Answer the receiver cosine"

	| z w |
	z := self unreal abs.
	w := z isZero
		ifTrue: [z]
		ifFalse: [qr sin negated * z sinh / z].
	^(self species 
				qr: qr cos * z cosh
				qi: qi * w
				qj: qj * w
				qk: qk * w)