testing
includes: aNumberOrInterval
aNumberOrInterval isIntervalUnion 
	ifTrue: [ ^aNumberOrInterval allSatisfy: [:i|self includes: i]].
^ aNumberOrInterval between: inf and: sup