as yet unclassified
hasConverged
	"Customized convergence test: minimize the function as g(x)<=g(0)+alpha*g'(0)"
	| g0 dg0 gNew |
	gNew := extendedResult at: 2.
	g0 := boundaryValues at: 1.
	dg0 := boundaryValues at: 2.
	^ gNew <= (alpha * dg0 + g0)