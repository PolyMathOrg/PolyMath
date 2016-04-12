*ArbitraryPrecisionFloat
adaptToArbitraryPrecisionFloat: rcvr andSend: selector
	"If I am involved in arithmetic with a Float, convert me to a Float."
	^ (self isInfinite or: [ self isNaN ])
		ifTrue: [ rcvr asFloat perform: selector with: self ]
		ifFalse: [ rcvr perform: selector with: (self asArbitraryPrecisionFloatNumBits: rcvr numBits) ]