arithmetic
- anObject
	"Answer the difference between the receiver and aNumber."
	| a b c d newReal newImaginary |
	anObject isComplexNumber
		ifTrue:
			[a := self real.
			b := self imaginary.
			c := anObject real.
			d := anObject imaginary.
			newReal := a - c.
			newImaginary := b - d.
			^ PMComplex real: newReal imaginary: newImaginary]
		ifFalse:
			[^ anObject adaptToComplex: self andSend: #-]