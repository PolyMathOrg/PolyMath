Extension { #name : #Number }

{ #category : #'*Math-ArbitraryPrecisionFloat' }
Number >> adaptToArbitraryPrecisionFloat: rcvr andCompare: selector [ 
	"If I am involved in comparison with a Float, convert rcvr to a
	Fraction. This way, no bit is lost and comparison is exact."
	
	^ rcvr asTrueFraction perform: selector with: self
]

{ #category : #'*Math-ArbitraryPrecisionFloat' }
Number >> adaptToArbitraryPrecisionFloat: rcvr andSend: selector [
	"If I am involved in arithmetic with a Float, convert me to a Float."
	^ (self isInfinite or: [ self isNaN ])
		ifTrue: [ rcvr asFloat perform: selector with: self ]
		ifFalse: [ rcvr perform: selector with: (self asArbitraryPrecisionFloatNumBits: rcvr numBits) ]
]

{ #category : #'*Math-ArbitraryPrecisionFloat' }
Number >> asArbitraryPrecisionFloatNumBits: n [ 
	self subclassResponsibility
]

{ #category : #'*Math-ArbitraryPrecisionFloat' }
Number >> asArbitraryPrecisionFloatNumDecimalDigits: n [
	^ self asArbitraryPrecisionFloatNumBits: (n / (2 log: 10)) ceiling
]
