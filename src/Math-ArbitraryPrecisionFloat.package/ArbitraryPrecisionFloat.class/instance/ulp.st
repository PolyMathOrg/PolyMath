truncation and round off
ulp
	mantissa = 0 ifTrue: [^self].
	^self one timesTwoPower: self exponent - nBits + 1