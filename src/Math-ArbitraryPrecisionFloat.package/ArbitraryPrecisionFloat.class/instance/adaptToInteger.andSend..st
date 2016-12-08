converting
adaptToInteger: rcvr andSend: selector
	^(rcvr asArbitraryPrecisionFloatNumBits: nBits) perform: selector with: self