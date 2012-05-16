double dispatching
dividingPolynomialWithRemainder: aPolynomial
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/4/99 "
	| remainderCoefficients quotientCoefficients n m norm quotientDegree |
	n := self degree.
	m := aPolynomial degree.
	quotientDegree := m - n.
	quotientDegree < 0
		ifTrue: [ ^Array with: ( self class new: #(0)) with: aPolynomial].
	quotientCoefficients := Array new: quotientDegree + 1.
	remainderCoefficients := ( 0 to: m) collect: [ :k | aPolynomial at: k].
	norm := 1 / coefficients first.
	quotientDegree to: 0 by: -1
		do: [ :k | | x |
			  x := ( remainderCoefficients at: n + k + 1) * norm.
			  quotientCoefficients at: (quotientDegree + 1 - k) put: x.
			  (n + k - 1) to: k by: -1
				do: [ :j | 
				remainderCoefficients at: j + 1 put: 
							( ( remainderCoefficients at: j + 1) - ( x * (self at: j - k)))
				].
			].
	^Array with: ( self class coefficients: quotientCoefficients reverse)
		   with: ( self class coefficients: ( remainderCoefficients copyFrom: 1 to: n))