double dispatching
timesPolynomial: aPolynomial
	
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