*Math-DHB-Numerical
equalsTo: aNumber
		"compare to Float>>closeTo:"
	^self relativelyEqualsTo: aNumber upTo: PMFloatingPointMachine new defaultNumericalPrecision