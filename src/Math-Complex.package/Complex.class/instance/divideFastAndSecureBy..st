arithmetic
divideFastAndSecureBy: anObject
	"Answer the result of dividing receiver by aNumber"
	" Both operands are scaled to avoid arithmetic overflow. 
	  This algorithm works for a wide range of values, and it needs only three divisions.
	  Note: #reciprocal uses #/ for devision "
	 
	| r d newReal newImaginary |
	anObject isComplex ifTrue:
		[anObject real abs > anObject imaginary abs
		  ifTrue:
		    [r := anObject imaginary / anObject real.
			d := r*anObject imaginary + anObject real.
			newReal := r*imaginary + real/d.
			newImaginary := r negated * real + imaginary/d.
		    ]
		  ifFalse:
		    [r := anObject real / anObject imaginary.
			d := r*anObject real + anObject imaginary.
			newReal := r*real + imaginary/d.
			newImaginary := r*imaginary - real/d.
		    ].
		
		^ Complex real: newReal imaginary: newImaginary].
	^ anObject adaptToComplex: self andSend: #/.