information
value: aNumber 
	"Computes the value of a cubic spline interpolation over the points of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 7/4/99 "

	| n1 n2 n step a b |
	coefficients isNil ifTrue: [self computeSecondDerivatives].
	n2 := pointCollection size.
	n1 := 1.
	[n2 - n1 > 1] whileTrue: 
			[n := (n1 + n2) // 2.
			(self xPointAt:  n) > aNumber ifTrue: [n2 := n] ifFalse: [n1 := n]].
	step := (self xPointAt: n2) - (self xPointAt: n1).
	a := ((self xPointAt: n2) - aNumber) / step.
	b := (aNumber - (self xPointAt: n1)) / step.
	^a * (self yPointAt: n1) + (b * (self yPointAt: n2)) 
		+ ((a * (a squared - 1) * (coefficients at: n1) 
				+ (b * (b squared - 1) * (coefficients at: n2))) * step squared 
				/ 6)