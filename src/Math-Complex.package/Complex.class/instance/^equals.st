comparing
= anObject
	anObject isNumber ifFalse: [^false].
	anObject isComplexNumber
		ifTrue: [^ (real = anObject real) & (imaginary = anObject imaginary)]
		ifFalse: [^ anObject adaptToComplex: self andSend: #=]