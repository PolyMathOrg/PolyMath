*ArbitraryPrecisionFloat
nextArbitraryPrecisionFloatNumBits: numBits
	"Always make an ArbitraryPrecisionFloat whether there is a decimal point or not.
	Do not bother with radix scale or other things"
	
	| numberOfTrailingZeroInIntegerPart mantissa numberOfNonZeroFractionDigits numberOfTrailingZeroInFractionPart |
	base := 10.
	neg := self peekSignIsMinus.
	integerPart := self nextUnsignedIntegerBase: base.
	numberOfTrailingZeroInIntegerPart := nDigits - lastNonZero.
	((sourceStream peekFor: $.) and: [(fractionPart := self nextUnsignedIntegerOrNilBase: base) notNil])
		ifTrue: 
			[numberOfNonZeroFractionDigits := lastNonZero.
			numberOfTrailingZeroInFractionPart := nDigits - lastNonZero]
		ifFalse:
			[fractionPart := 0.
			numberOfNonZeroFractionDigits := 0.
			numberOfTrailingZeroInFractionPart := 0].
	self readExponent.
	fractionPart isZero
		ifTrue:
			[mantissa := integerPart // (base raisedToInteger: numberOfTrailingZeroInIntegerPart).
			exponent := exponent + numberOfTrailingZeroInIntegerPart]
		ifFalse:
			[mantissa := integerPart * (base raisedToInteger: numberOfNonZeroFractionDigits)
				+ (fractionPart // (base raisedToInteger: numberOfTrailingZeroInFractionPart)).
			exponent := exponent - numberOfNonZeroFractionDigits].
	neg ifTrue: [mantissa := mantissa negated].
	^self makeArbitraryPrecisionFloatFromMantissa: mantissa exponent: exponent base: base numBits: numBits