double dispatching
timesPolynomial: aPolynomial
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/4/99 "
	| productCoefficients degree|
	degree := aPolynomial degree + self degree.
	productCoefficients := ( degree to: 0 by: -1)
			collect:[ :n | | sum |
					  sum := 0.
					  0 to: (degree - n)
						do: [ :k | sum := (self at: k) * (aPolynomial at: ( degree - n - k)) + sum].
					  sum
					].
	^self class coefficients: productCoefficients