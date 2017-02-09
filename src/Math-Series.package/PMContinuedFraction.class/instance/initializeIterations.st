operation
initializeIterations
	"Initialize the series.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/3/99 "

	numerator := self limitedSmallValue: termServer initialTerm.
	denominator := 0.
	result := numerator