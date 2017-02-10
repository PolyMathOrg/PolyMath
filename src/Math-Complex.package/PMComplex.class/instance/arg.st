arithmetic
arg
	"Answer the argument of the receiver."

	self isZero ifTrue: [self error: 'zero has no argument.'].
	^imaginary arcTan: real