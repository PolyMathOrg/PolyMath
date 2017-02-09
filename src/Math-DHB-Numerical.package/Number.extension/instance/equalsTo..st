*Math-DHB-Numerical
equalsTo: aNumber
		"compare to Float>>closeTo:
		
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 21/4/99 "
	^self relativelyEqualsTo: aNumber upTo: PMFloatingPointMachine new defaultNumericalPrecision