converting
asArbitraryPrecisionFloatNumBits: n 
	^ nBits = n
		ifTrue: [self]
		ifFalse: [self copy setPrecisionTo: n]