parsing-public
nextFraction
	| numerator denominator numberOfTrailingZeroInIntegerPart |
	base := 10.
	neg := self peekSignIsMinus.
	(integerPart := self nextUnsignedIntegerOrNilBase: base)
		ifNil: [numberOfTrailingZeroInIntegerPart := 0]
		ifNotNil: [
			numberOfTrailingZeroInIntegerPart := nDigits - lastNonZero.
			(sourceStream peekFor: $r)
				ifTrue: ["<base>r<integer>"
					(base := integerPart) < 2
						ifTrue: [
							sourceStream skip: -1.
							^ self expected: 'an integer greater than 1 as valid radix'].
					self peekSignIsMinus
						ifTrue: [neg := neg not].
					integerPart := self nextUnsignedIntegerBase: base.
					numberOfTrailingZeroInIntegerPart := nDigits - lastNonZero]].
	(sourceStream peekFor: $.)
		ifTrue:
			[^self readFractionPartNumberOfTrailingZeroInIntegerPart: numberOfTrailingZeroInIntegerPart].
	integerPart
		ifNil:
			["No integerPart, raise an error"
			^ self expected: 'a digit'].
	numerator := neg
		ifTrue: [integerPart negated]
		ifFalse: [integerPart].
	self readExponent ifTrue: [numerator := numerator * (base raisedToInteger: exponent)].
	(sourceStream peekFor: $/) ifFalse: [^numerator].
	base := 10.
	(denominator := self nextUnsignedIntegerOrNilBase: base)
		ifNil:
			[sourceStream skip: -1. "Not a valid denominator, ungobble / and return numerator"
			^numerator].
	(sourceStream peekFor: $r)
		ifTrue: ["<base>r<integer>"
			(base := denominator) < 2
				ifTrue: [
					sourceStream skip: -1.
					^ self expected: 'an integer greater than 1 as valid radix'].
			denominator := self nextUnsignedIntegerBase: base].
	self readExponent ifTrue: [denominator := denominator * (base raisedToInteger: exponent)].
	^numerator / denominator