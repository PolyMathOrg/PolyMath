arithmetic
divideSecureBy: anObject
	"Answer the result of dividing receiver by aNumber"
	" Both operands are scaled to avoid arithmetic overflow. This algorithm 
	  works for a wide range of values, but it requires six divisions.  
	  #divideFastAndSecureBy:  is also quite good, but it uses only 3 divisions.
	   Note: #reciprocal uses #/ for devision"
	 
	| s ars ais brs bis newReal newImaginary |
	anObject isComplex ifTrue:
		[s := anObject real abs + anObject imaginary abs.
		 ars := self real / s.
		 ais := self imaginary / s.
		 brs := anObject real / s.
		 bis := anObject imaginary / s.
		 s := brs squared + bis squared.
		
		newReal := ars*brs + (ais*bis) /s.
		newImaginary := ais*brs - (ars*bis)/s.
		^ Complex real: newReal imaginary: newImaginary].
	^ anObject adaptToComplex: self andSend: #/.