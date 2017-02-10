arithmetic
raisedToInteger: anInteger 
	| bitProbe highPrecisionSelf n result |
	n := anInteger abs.
	(n < 5 or: [n * nBits < 512])
		ifTrue: [^ self naiveRaisedToInteger: anInteger].
	bitProbe := 1 bitShift: n highBit - 1.
	highPrecisionSelf := self asArbitraryPrecisionFloatNumBits: n highBit * 2 + nBits + 2.
	result := highPrecisionSelf one.
	
	[(n bitAnd: bitProbe) = 0 ifFalse: [result := result * highPrecisionSelf].
	(bitProbe := bitProbe bitShift: -1) > 0]
		whileTrue: [result := result squared].
		
	^ (anInteger negative
		ifTrue: [result reciprocal]
		ifFalse: [result])
		asArbitraryPrecisionFloatNumBits: nBits