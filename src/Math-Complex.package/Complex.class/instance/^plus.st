arithmetic
+ anObject
	"Answer the sum of the receiver and aNumber."
	| a b c d newReal newImaginary |
	anObject isComplex
		ifTrue:
			[a := self real.
			b := self imaginary.
			c := anObject real.
			d := anObject imaginary.
			newReal := a + c.
			newImaginary := b + d.
			^ Complex real: newReal imaginary: newImaginary]
		ifFalse:
			[^ anObject adaptToComplex: self andSend: #+]