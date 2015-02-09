converting
adaptToFloat: rcvr andSend: selector
	^(rcvr asArbitraryPrecisionFloatNumBits: 53) perform: selector with: self