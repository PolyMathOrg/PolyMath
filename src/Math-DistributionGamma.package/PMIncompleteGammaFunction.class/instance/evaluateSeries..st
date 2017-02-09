private
evaluateSeries: aNumber

	series isNil
		ifTrue: [ series := PMIncompleteGammaSeriesTermServer new.
				  series setParameter: alpha.
				].
	series setArgument: aNumber.
	^(PMInfiniteSeries server: series)
		desiredPrecision: PMFloatingPointMachine new defaultNumericalPrecision;
		evaluate