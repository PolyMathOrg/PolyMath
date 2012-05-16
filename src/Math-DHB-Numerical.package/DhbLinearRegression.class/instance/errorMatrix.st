information
errorMatrix
	"Answer the resulting linear dependence found by the receiver in the form of a polynomial
		 with embedded error matrix.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 18/3/99 "

	| c1 cx cxx |
	c1 := 1.0 / (sumXX * sum1 - sumX squared).
	cx := sumX negated * c1.
	cxx := sumXX * c1.
	c1 := sum1 * c1.
	^DhbSymmetricMatrix rows: (Array with: (Array with: cxx with: cx)
				with: (Array with: cx with: c1))