initialization
initialize
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	bestPoints := SortedCollection sortBlock: [ :a :b | a betterThan: b].
	^super initialize