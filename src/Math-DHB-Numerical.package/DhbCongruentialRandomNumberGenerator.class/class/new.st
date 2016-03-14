creation
new
		"Create a new instance of the receiver with D. Knuth's constants.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	UniqueInstance isNil
		ifTrue: [ UniqueInstance := super new initialize.
					 UniqueInstance setSeed: 1.
				   ].
	^UniqueInstance