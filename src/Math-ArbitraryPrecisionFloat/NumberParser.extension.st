Extension { #name : #NumberParser }

{ #category : #'*Math-ArbitraryPrecisionFloat' }
NumberParser >> makeArbitraryPrecisionFloatFromMantissa: m exponent: k base: aRadix numBits: nBits [
	"Convert infinite precision arithmetic into Floating point with prescribed precision."

	^(k positive
		ifTrue: [m * (aRadix raisedToInteger: k)]
		ifFalse: [Fraction numerator: m denominator: (aRadix raisedToInteger: k negated)]) asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #'*Math-ArbitraryPrecisionFloat' }
NumberParser >> nextArbitraryPrecisionFloatNumBits: numBits [
	"Always make an ArbitraryPrecisionFloat whether there is a decimal point or not.
	Do not bother with radix scale or other things"

	| numberOfTrailingZeroInIntegerPart mantissa numberOfNonZeroFractionDigits numberOfTrailingZeroInFractionPart |
	base := 10.
	neg := self peekSignIsMinus.
	integerPart := self nextUnsignedIntegerBase: base.
	numberOfTrailingZeroInIntegerPart := nDigits - lastNonZero.
	numberOfTrailingZeroInFractionPart := ((sourceStream peekFor: $.) and: [ (fractionPart := self nextUnsignedIntegerOrNilBase: base) notNil ])
		                                      ifTrue: [
			                                      numberOfNonZeroFractionDigits := lastNonZero.
			                                      nDigits - lastNonZero ]
		                                      ifFalse: [
			                                      fractionPart := 0.
			                                      numberOfNonZeroFractionDigits := 0.
			                                      0 ].
	self readExponent.
	exponent := fractionPart isZero
		            ifTrue: [
			            mantissa := integerPart // (base raisedToInteger: numberOfTrailingZeroInIntegerPart).
			            exponent + numberOfTrailingZeroInIntegerPart ]
		            ifFalse: [
			            mantissa := integerPart * (base raisedToInteger: numberOfNonZeroFractionDigits)
			                        + (fractionPart // (base raisedToInteger: numberOfTrailingZeroInFractionPart)).
			            exponent - numberOfNonZeroFractionDigits ].
	neg ifTrue: [ mantissa := mantissa negated ].
	^ self
		  makeArbitraryPrecisionFloatFromMantissa: mantissa
		  exponent: exponent
		  base: base
		  numBits: numBits
]
