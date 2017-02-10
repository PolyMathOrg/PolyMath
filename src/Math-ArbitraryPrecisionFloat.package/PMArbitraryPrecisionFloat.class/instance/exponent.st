accessing
exponent
	"anwser the floating point like exponent e,
	of self normalized as
	1.mmmmmm * (2 raisedTo: e)"
	
	self isZero ifTrue: [^0].
	^biasedExponent + self numBitsInMantissa - 1