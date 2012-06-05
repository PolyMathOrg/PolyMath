*Math-DHB-NumericalExtensions
relativelyEqualsTo: aNumber upTo: aSmallNumber
		"compare to Float>>closeTo:
		generally called from Number>>equalsTo:
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 21/4/99 "
	| norm |
	norm := self abs max: aNumber abs.
	^norm <= DhbFloatingPointMachine new defaultNumericalPrecision
		or: [ (self - aNumber) abs < ( aSmallNumber * norm)]