parsing-private
readNumberWithoutIntegerPartOrNil
	"at this stage, sign followed by a decimal point have been read, but no intergerPart
	try and form a number with a fractionPart"
	
	| numberOfNonZeroFractionDigits numberOfTrailingZeroInFractionPart mantissa value |
	integerPart := 0.
	fractionPart := self nextUnsignedIntegerOrNilBase: base.
	fractionPart ifNil: [
		"No integer part, no fractionPart, this does not look like a number..."
		^nil].
	numberOfNonZeroFractionDigits := lastNonZero.
	numberOfTrailingZeroInFractionPart := nDigits - lastNonZero.
	self readExponent
		ifFalse: [self readScale
				ifTrue: [^self makeScaledDecimalWithNumberOfNonZeroFractionDigits: numberOfNonZeroFractionDigits
					andNumberOfTrailingZeroInFractionPart: numberOfTrailingZeroInFractionPart]].

	fractionPart isZero
		ifTrue: [mantissa := 0]
		ifFalse: [mantissa := (fractionPart // (base raisedToInteger: numberOfTrailingZeroInFractionPart)).
			exponent := exponent - numberOfNonZeroFractionDigits].

	value := self makeFloatFromMantissa: mantissa exponent: exponent base: base.
	^ neg
		ifTrue: [value isZero
				ifTrue: [Float negativeZero]
				ifFalse: [value negated]]
		ifFalse: [value]