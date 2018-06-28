Extension { #name : #Integer }

{ #category : #'*Math-ArbitraryPrecisionFloat' }
Integer >> asArbitraryPrecisionFloatNumBits: n [
	^PMArbitraryPrecisionFloat 
		mantissa: self
		exponent: 0
		nBits: n
]
