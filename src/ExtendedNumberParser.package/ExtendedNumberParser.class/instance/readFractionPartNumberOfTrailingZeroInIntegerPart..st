parsing-private
readFractionPartNumberOfTrailingZeroInIntegerPart: numberOfTrailingZeroInIntegerPart
	"at this stage, sign integerPart and a fraction point have been read.
	try and form a number with a fractionPart"
	
	| numberOfNonZeroFractionDigits numberOfTrailingZeroInFractionPart mantissa value |
	fractionPart := self nextUnsignedIntegerOrNilBase: base.
	fractionPart
		ifNil: [
			"No fractionPart found, but can be an extended 1.e2 syntax"
			integerPart ifNil: ["No integerPart, nor fractionPart found, ungobble the fraction point and raise an error"
					sourceStream skip: -1.
					^self expected: 'a digit'].
			fractionPart := 0.
			numberOfNonZeroFractionDigits := 0.
			numberOfTrailingZeroInFractionPart := 0]
		ifNotNil: [.
			numberOfNonZeroFractionDigits := lastNonZero.
			numberOfTrailingZeroInFractionPart := nDigits - lastNonZero].
	self readExponent.
	integerPart ifNil: [integerPart := 0].
	
	fractionPart isZero
		ifTrue: [mantissa := integerPart
						// (base raisedToInteger: numberOfTrailingZeroInIntegerPart).
			exponent := exponent + numberOfTrailingZeroInIntegerPart]
		ifFalse: [mantissa := integerPart
						* (base raisedToInteger: numberOfNonZeroFractionDigits) + (fractionPart // (base raisedToInteger: numberOfTrailingZeroInFractionPart)).
			exponent := exponent - numberOfNonZeroFractionDigits].

	value := exponent positive
		ifTrue: [mantissa * (base raisedToInteger: exponent)]
		ifFalse: [mantissa / (base raisedToInteger: exponent negated)].
	^ neg
		ifTrue: [value negated]
		ifFalse: [value]