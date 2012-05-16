information
evaluateSeries: aNumber
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/3/99 "
	series isNil
		ifTrue: [ series := DhbIncompleteGammaSeriesTermServer new.
				  series setParameter: alpha.
				].
	series setArgument: aNumber.
	^(DhbInfiniteSeries server: series)
		desiredPrecision: DhbFloatingPointMachine new defaultNumericalPrecision;
		evaluate