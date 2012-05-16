creation
new
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 21/4/99 "
	UniqueInstance = nil
		ifTrue: [ UniqueInstance := super new].
	^UniqueInstance