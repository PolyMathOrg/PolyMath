initialization
initialize
		"Private"
	bestPoints := SortedCollection sortBlock: [ :a :b | a betterThan: b].
	^super initialize