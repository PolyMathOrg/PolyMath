instance creation
readFrom: aStream numBits: n
	"read a number from an ASCII encoded decimal representation with
	- an optional sign {-|+}
	- an integer part [0-9]+
	- an optional decimalPoint and fractionPart {.[0-9]*}
	- an optional exponent {e{-|+}[0-9]+}"

	^(ExtendedNumberParser on: aStream)
		failBlock: [self error: 'invalid ArbitraryPrecisionFloat format'];
		nextArbitraryPrecisionFloatNumBits: n