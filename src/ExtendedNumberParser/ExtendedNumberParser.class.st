"
An ExtendedNumberParser is extending Squeak number syntax with these rules

- allow partial specification of integer and fraction parts:
1.e2 .1e3 are both 100.0
- allow plus sign before number and in exponent


"
Class {
	#name : #ExtendedNumberParser,
	#superclass : #NumberParser,
	#category : #ExtendedNumberParser
}

{ #category : #accessing }
ExtendedNumberParser >> allowPlusSign [
	^true
]

{ #category : #accessing }
ExtendedNumberParser >> exponentLetters [
	"Allow uppercase exponent letter."
	
	^'edqEDQ'
]

{ #category : #'parsing-public' }
ExtendedNumberParser >> nextFraction [
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
]

{ #category : #'parsing-public' }
ExtendedNumberParser >> nextNumber [
	"main method for reading a number.
	This one can read Float Integer and ScaledDecimal"

	| numberOfTrailingZeroInIntegerPart |
	base := 10.
	neg := self peekSignIsMinus.
	integerPart := self nextUnsignedIntegerOrNilBase: base.
	integerPart ifNil: [
		^ (sourceStream peekFor: $.)
			  ifTrue: [ "Try .1 syntax" self readNumberWithoutIntegerPart ]
			  ifFalse: [ "This is not a regular number beginning with a digit
			It is time to check for exceptional condition NaN and Infinity"
				  self readNamedFloatOrFail ] ].
	numberOfTrailingZeroInIntegerPart := nDigits - lastNonZero.
	(sourceStream peekFor: $r) ifTrue: [ "<base>r<integer>"
		| oldNeg pos |
		pos := sourceStream position.
		(base := integerPart) < 2 ifTrue: [ "A radix currently need to be greater than 1, ungobble the r and return the integer part"
			sourceStream skip: -1.
			^ neg
				  ifTrue: [ base negated ]
				  ifFalse: [ base ] ].
		oldNeg := neg.
		self peekSignIsMinus ifTrue: [ neg := neg not ].
		integerPart := self nextUnsignedIntegerOrNilBase: base.
		integerPart ifNil: [
			(sourceStream peekFor: $.) ifTrue: [ self readNumberWithoutIntegerPartOrNil ifNotNil: [ :aNumber | ^ aNumber ] ].
			sourceStream position: pos.
			^ oldNeg
				  ifTrue: [ base negated ]
				  ifFalse: [ base ] ].
		numberOfTrailingZeroInIntegerPart := nDigits - lastNonZero ].
	^ (sourceStream peekFor: $.)
		  ifTrue: [ self readNumberWithFractionPartNumberOfTrailingZeroInIntegerPart: numberOfTrailingZeroInIntegerPart ]
		  ifFalse: [ self makeIntegerOrScaledInteger ]
]

{ #category : #'parsing-private' }
ExtendedNumberParser >> readFractionPartNumberOfTrailingZeroInIntegerPart: numberOfTrailingZeroInIntegerPart [
	"at this stage, sign integerPart and a fraction point have been read.
	try and form a number with a fractionPart"

	| numberOfNonZeroFractionDigits numberOfTrailingZeroInFractionPart mantissa value |
	fractionPart := self nextUnsignedIntegerOrNilBase: base.
	numberOfTrailingZeroInFractionPart := fractionPart
		                                      ifNil: [ "No fractionPart found, but can be an extended 1.e2 syntax"
			                                      integerPart ifNil: [ "No integerPart, nor fractionPart found, ungobble the fraction point and raise an error"
				                                      sourceStream skip: -1.
				                                      ^ self expected: 'a digit' ].
			                                      fractionPart := 0.
			                                      numberOfNonZeroFractionDigits := 0.
			                                      0 ]
		                                      ifNotNil: [
			                                      numberOfNonZeroFractionDigits := lastNonZero.
			                                      nDigits - lastNonZero ].
	self readExponent.
	integerPart ifNil: [ integerPart := 0 ].
	exponent := fractionPart isZero
		            ifTrue: [
			            mantissa := integerPart // (base raisedToInteger: numberOfTrailingZeroInIntegerPart).
			            exponent + numberOfTrailingZeroInIntegerPart ]
		            ifFalse: [
			            mantissa := integerPart * (base raisedToInteger: numberOfNonZeroFractionDigits)
			                        + (fractionPart // (base raisedToInteger: numberOfTrailingZeroInFractionPart)).
			            exponent - numberOfNonZeroFractionDigits ].

	value := exponent positive
		         ifTrue: [ mantissa * (base raisedToInteger: exponent) ]
		         ifFalse: [ mantissa / (base raisedToInteger: exponent negated) ].
	^ neg
		  ifTrue: [ value negated ]
		  ifFalse: [ value ]
]

{ #category : #'parsing-private' }
ExtendedNumberParser >> readNumberWithFractionPartNumberOfTrailingZeroInIntegerPart: numberOfTrailingZeroInIntegerPart [
	"at this stage, sign integerPart and a decimal point have been read.
	try and form a number with a fractionPart"

	| numberOfNonZeroFractionDigits numberOfTrailingZeroInFractionPart mantissa value |
	fractionPart := self nextUnsignedIntegerOrNilBase: base.
	numberOfTrailingZeroInFractionPart := fractionPart
		                                      ifNil: [ "No fractionPart found, but can be a 1.e2 syntax"
			                                      fractionPart := 0.
			                                      numberOfNonZeroFractionDigits := 0.
			                                      0 ]
		                                      ifNotNil: [
			                                      numberOfNonZeroFractionDigits := lastNonZero.
			                                      nDigits - lastNonZero ].
	self readExponent ifFalse: [
		self readScale ifTrue: [
			^ self
				  makeScaledDecimalWithNumberOfNonZeroFractionDigits: numberOfNonZeroFractionDigits
				  andNumberOfTrailingZeroInFractionPart: numberOfTrailingZeroInFractionPart ] ].
	exponent := fractionPart isZero
		            ifTrue: [
			            mantissa := integerPart // (base raisedToInteger: numberOfTrailingZeroInIntegerPart).
			            exponent + numberOfTrailingZeroInIntegerPart ]
		            ifFalse: [
			            mantissa := integerPart * (base raisedToInteger: numberOfNonZeroFractionDigits)
			                        + (fractionPart // (base raisedToInteger: numberOfTrailingZeroInFractionPart)).
			            exponent - numberOfNonZeroFractionDigits ].

	value := self makeFloatFromMantissa: mantissa exponent: exponent base: base.
	^ neg
		  ifTrue: [
			  value isZero
				  ifTrue: [ Float negativeZero ]
				  ifFalse: [ value negated ] ]
		  ifFalse: [ value ]
]

{ #category : #'parsing-private' }
ExtendedNumberParser >> readNumberWithoutIntegerPart [
	"at this stage, sign followed by a decimal point have been read, but no intergerPart
	try and form a number with a fractionPart"
	
	^self readNumberWithoutIntegerPartOrNil ifNil: [
		"No integer part, no fractionPart, this does not look like a number..."
		^self expected: 'a digit between 0 and 9'].
]

{ #category : #'parsing-private' }
ExtendedNumberParser >> readNumberWithoutIntegerPartOrNil [
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
]
