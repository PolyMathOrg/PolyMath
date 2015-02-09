converting
adaptToFloat: rcvr andCompare: selector
	^(rcvr asArbitraryPrecisionFloatNumBits: 53) perform: selector with: self