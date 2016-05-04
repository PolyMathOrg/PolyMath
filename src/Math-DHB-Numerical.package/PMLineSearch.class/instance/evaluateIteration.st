operation
evaluateIteration
	| a b tmp1 tmp2 gamma nextX g0 g1 dg0 deltaX x1 x2 |
	g0 := boundaryValues at: 1.
	dg0 := boundaryValues at: 2.
	g1 := boundaryValues at: 3.
	x1 := extendedResult at: 1.
	x2 := extendedResult at: 3.
	deltaX := x1 - x2.
	useCubicApproximation
		ifFalse: [
			nextX := dg0 negated * 0.5 / (g1 - g0 - dg0) max: 0.1.
			useCubicApproximation := true ]
		ifTrue: [
			gamma := [ :n | 
				((extendedResult at: (n+2)) - dg0 * (extendedResult at: n) - g0) / deltaX ].
			tmp1 := (gamma value: 1) / x1 squared.
			tmp2 := (gamma value: 2) / x2 squared.
			a := tmp1 - tmp2.
			b :=  x1 * tmp2 - x2 * tmp1.
			nextX := (b negated + (b squared - (3.0 * a * dg0) sqrt)) / (3.0 * a) min: 0.5 *x1 max: 0.1 * x1.
			nextX < failingMin ifTrue: [ self error: 'next x is too small: cannot minimize' ] ].
	self updateResult: nextX.