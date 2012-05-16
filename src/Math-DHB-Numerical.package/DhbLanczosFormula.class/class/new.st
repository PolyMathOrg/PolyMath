creation
new
		"Answer a unique instance. Create it if it does not exist.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 4/1/99 "
	UniqueInstance isNil
		ifTrue: [ UniqueInstance := super new.
					 UniqueInstance initialize.
					].
	^UniqueInstance