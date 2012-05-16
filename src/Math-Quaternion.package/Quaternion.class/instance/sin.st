mathematical functions
sin
	"Answer the receiver sine"

	| z w |
	z := self unreal abs.
	w := z isZero
		ifTrue: [z]
		ifFalse: [qr cos * z sinh / z].
	^(self species 
				qr: qr sin * z cosh
				qi: qi * w
				qj: qj * w
				qk: qk * w)