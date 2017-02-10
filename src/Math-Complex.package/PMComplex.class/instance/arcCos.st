mathematical functions
arcCos
	"Answer the arc cosine of the receiver.
	This is the inverse function of cos."

	| x y tmp sh2y shy delta ch2y chy |
	imaginary = 0 ifTrue: [real abs > 1
			ifTrue: 
				[x := real < 0
					ifTrue: [Float pi]
					ifFalse: [0].
				y := real copySignTo: real abs arCosh.
				^self class real: x imaginary: y]
			ifFalse: [^self class real: real arcCos imaginary: 0]].
	tmp := self squaredNorm - 1 / 2.
	delta := tmp squared + imaginary squared.
	sh2y := tmp + delta sqrt.
	shy := sh2y sqrt.
	ch2y := 1 + sh2y.
	chy := ch2y sqrt.
	y := imaginary copySignTo: shy arSinh.
	x := (real / chy) arcCos.
	^self class real: x imaginary: y negated