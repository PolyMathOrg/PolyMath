truncation and round off
predecessor
	mantissa = 0 ifTrue: [^self].
	mantissa negative ifTrue: [^self negated successor negated].
	^mantissa isPowerOfTwo
		ifTrue: [self - (self ulp timesTwoPower: -1)]
		ifFalse: [self - self ulp]