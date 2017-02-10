arithmetic
* anObject
	"Answer the result of multiplying the receiver by aNumber."
	| a b c d newReal newImaginary |
	anObject isComplexNumber
		ifTrue:
			[a := self real.
			b := self imaginary.
			c := anObject real.
			d := anObject imaginary.
			newReal := (a * c) - (b * d).
			newImaginary := (a * d) + (b * c).
			^ PMComplex real: newReal imaginary: newImaginary]
		ifFalse:
			[^ anObject adaptToComplex: self andSend: #*]