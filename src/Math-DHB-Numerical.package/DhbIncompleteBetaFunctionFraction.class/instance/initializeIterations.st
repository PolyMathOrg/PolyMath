operation
initializeIterations
	"Initialize the iterations (subclasses must write their own method and call this one last).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/3/99 "

	numerator := 1.
	denominator := 1 / (self limitedSmallValue: 1 - (q1 * x / q2)).
	result := denominator