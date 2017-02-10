arithmetic
/ anObject
	"Answer the result of dividing receiver by aNumber"
	| a b c d newReal newImaginary |
	anObject isComplexNumber ifTrue:
		[a := self real.
		b := self imaginary.
		c := anObject real.
		d := anObject imaginary.
		newReal := ((a * c) + (b * d)) / ((c * c) + (d * d)).
		newImaginary := ((b * c) - (a * d)) / ((c * c) + (d * d)).
		^ PMComplex real: newReal imaginary: newImaginary].
	^ anObject adaptToComplex: self andSend: #/.