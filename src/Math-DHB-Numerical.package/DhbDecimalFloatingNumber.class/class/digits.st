information
digits
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 9/6/99 "
	Digits isNil
		ifTrue: [ Digits := self defaultDigits].
	^Digits