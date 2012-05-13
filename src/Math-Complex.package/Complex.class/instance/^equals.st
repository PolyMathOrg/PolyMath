comparing
= anObject
	anObject isNumber ifFalse: [^false].
	anObject isComplex
		ifTrue: [^ (real = anObject real) & (imaginary = anObject imaginary)]
		ifFalse: [^ anObject adaptToComplex: self andSend: #=]