Extension { #name : #ScaledDecimal }

{ #category : #'*Math-ArbitraryPrecisionFloat' }
ScaledDecimal >> asArbitraryPrecisionFloatNumBits: n [
	^self asFraction asArbitraryPrecisionFloatNumBits: n
]
