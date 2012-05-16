operation
evaluateIteration
	"Compute and add the next term of the fraction.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/3/99 "

	| m m2 temp |
	m := iterations + 1.
	m2 := m * 2.
	temp := m * (alpha2 - m) * x 
				/ ((q3 + m2) * (alpha1 + m2)).
	denominator := self limitedSmallValue: ( denominator * temp + 1).
	numerator := self limitedSmallValue: ( temp / numerator + 1).
	denominator := 1 / denominator.
	result := result * numerator * denominator.
	temp := (alpha1 + m) negated * (q1 + m) * x 
				/ ((q2 + m2) * (alpha1 + m2)).
	denominator := self limitedSmallValue: ( denominator * temp + 1).
	numerator := self limitedSmallValue: ( temp / numerator + 1).
	denominator := 1 / denominator.
	temp := numerator * denominator.
	result := result * temp.
	^(temp - 1) abs