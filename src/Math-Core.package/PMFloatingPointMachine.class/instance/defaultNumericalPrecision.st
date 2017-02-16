information
defaultNumericalPrecision

	defaultNumericalPrecision isNil
		ifTrue: [ defaultNumericalPrecision := self machinePrecision sqrt].
	^defaultNumericalPrecision