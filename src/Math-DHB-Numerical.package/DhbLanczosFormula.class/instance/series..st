information
series: aNumber
		"Private - Answer the value of the series of Lanczos' formula.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/3/99 "
	| term |
	term := aNumber.
	^coefficients inject: 1.000000000190015
						into: [ :sum :each | term := term + 1. each / term + sum]