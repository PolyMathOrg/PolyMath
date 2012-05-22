*Math-Number-Extensions-mathematical functions
arCosh
	"Answer receiver's area hyperbolic cosine.
	That is the inverse function of cosh."

	self < 1 
		ifTrue: 
			[^DomainError signal: 'Receiver must be greater or equal to 1'].
	^self + 1 = self 
		ifTrue: [self abs ln + 2 ln]
		ifFalse: [((self squared - 1) sqrt + self) ln]