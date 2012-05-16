information
initializeRandomCoefficientsForLargeAlpha
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 4/3/99 "
	| a b q d |
	a := 1 / ( 2 * alpha - 1) sqrt.
	b := alpha - (4 ln).
	q := 1 / a + alpha.
	d := 4.5 ln + 1.
	^Array with: a with: b with: q with: d