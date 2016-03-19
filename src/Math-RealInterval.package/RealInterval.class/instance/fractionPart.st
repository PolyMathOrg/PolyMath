truncation
fractionPart
	|s|
^self isMixed 
	ifTrue: [ s:=self split: 0.
		s first fractionPart union: s second fractionPart] 
	ifFalse: [self negative 
		ifTrue: [ self negated privateFractionPart negated] 
		ifFalse:[ self privateFractionPart. ] ].
