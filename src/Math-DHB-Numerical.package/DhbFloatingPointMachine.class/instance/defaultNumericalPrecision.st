information
defaultNumericalPrecision
		"
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 22/4/99 "
	defaultNumericalPrecision isNil
		ifTrue: [ defaultNumericalPrecision := self machinePrecision sqrt].
	^defaultNumericalPrecision