converting
adaptToFloat: rcvr andSend: selector
	^ (rcvr isInfinite or: [ rcvr isNaN ])
		ifTrue: [ rcvr perform: selector with: self asFloat ]
		ifFalse: [ (rcvr asArbitraryPrecisionFloatNumBits: 53) perform: selector with: self ]