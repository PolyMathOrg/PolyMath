*Math-RealInterval
hull: aNumberOrInterval 
^self isInfinite 
	ifTrue: [ (aNumberOrInterval isRealInterval or:[aNumberOrInterval isIntervalUnion ]) 
		ifTrue: [ aNumberOrInterval hull:self ] 
		ifFalse:[ RealInterval inf: (aNumberOrInterval min:self) sup: (aNumberOrInterval max: self)]  ] 	ifFalse:[(RealInterval fromNumber: self)hull: aNumberOrInterval]