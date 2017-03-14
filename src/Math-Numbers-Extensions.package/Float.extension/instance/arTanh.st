*Math-Numbers-Extensions-mathematical functions
arTanh
	"Answer receiver's area hyperbolic tangent.
	That is the inverse function of tanh."

	self = 0.0 ifTrue: [^self].	"Handle negativeZero"
	self abs = 1 ifTrue: [^self copySignTo: Float infinity].
	self abs > 1 
		ifTrue: 
			[^DomainError signal: 'Receiver must be between -1.0 and 1.0'].
	^((1 + self) / (1 - self)) ln / 2