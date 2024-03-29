Extension { #name : #Float }

{ #category : #'*Math-ArbitraryPrecisionFloat' }
Float >> asArbitraryPrecisionFloatNumBits: n [
	self isNaN ifTrue: [self error: 'cannot convert NaN to arbitrary precision'].
	self isInfinite ifTrue: [self error: 'cannot convert Infinity to arbitrary precision'].
	self isZero ifTrue: [^0 asArbitraryPrecisionFloatNumBits: n ].
	^ PMArbitraryPrecisionFloat new
		mantissa: self significandAsInteger * self sign
		exponent: (self exponent max: -1022) - 52
		nBits: n
]
