private
evaluateSeries: aNumber

	series isNil
		ifTrue: [ series := DhbIncompleteGammaSeriesTermServer new.
				  series setParameter: alpha.
				].
	series setArgument: aNumber.
	^(DhbInfiniteSeries server: series)
		desiredPrecision: DhbFloatingPointMachine new defaultNumericalPrecision;
		evaluate