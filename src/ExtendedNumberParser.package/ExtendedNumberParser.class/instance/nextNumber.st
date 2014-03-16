parsing-public
nextNumber
	"main method for reading a number.
	This one can read Float Integer and ScaledDecimal"
	
	| numberOfTrailingZeroInIntegerPart |
	base := 10.
	neg := self peekSignIsMinus.
	integerPart := self nextUnsignedIntegerOrNilBase: base.
	integerPart ifNil: [(sourceStream peekFor: $.)
		ifTrue: [
			"Try .1 syntax"
			^self readNumberWithoutIntegerPart]
		ifFalse: [
			"This is not a regular number beginning with a digit
			It is time to check for exceptional condition NaN and Infinity"
			^self readNamedFloatOrFail]].
	numberOfTrailingZeroInIntegerPart := nDigits - lastNonZero.
	(sourceStream peekFor: $r)
		ifTrue: ["<base>r<integer>"
			| oldNeg pos |
			pos := sourceStream position.
			(base := integerPart) < 2
				ifTrue: ["A radix currently need to be greater than 1, ungobble the r and return the integer part"
					sourceStream skip: -1.
					^neg
						ifTrue: [base negated]
						ifFalse: [base]].
			oldNeg := neg.
			self peekSignIsMinus ifTrue: [neg := neg not].
			integerPart := self nextUnsignedIntegerOrNilBase: base.
			integerPart ifNil: [
				(sourceStream peekFor: $.) ifTrue: [self readNumberWithoutIntegerPartOrNil ifNotNil: [:aNumber | ^aNumber]].
				sourceStream position: pos.
					^oldNeg
						ifTrue: [base negated]
						ifFalse: [base]].
			numberOfTrailingZeroInIntegerPart := nDigits - lastNonZero].
	^ (sourceStream peekFor: $.)
		ifTrue: [self readNumberWithFractionPartNumberOfTrailingZeroInIntegerPart: numberOfTrailingZeroInIntegerPart]
		ifFalse: [self makeIntegerOrScaledInteger]