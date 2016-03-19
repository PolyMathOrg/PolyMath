*Math-RealInterval
intersection: aNumberOrInterval 
^(aNumberOrInterval isRealInterval or:[aNumberOrInterval isIntervalUnion ])
	ifTrue: [ aNumberOrInterval intersection: self ] 
	ifFalse: [ self = aNumberOrInterval 
		ifTrue: [ self ] 
		ifFalse: [RealInterval new ] ]