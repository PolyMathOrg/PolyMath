creation
new
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/11/00 "
	UniqueInstance isNil
		ifTrue: [ UniqueInstance := self default].
	^UniqueInstance