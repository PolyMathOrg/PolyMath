iterative algorithms
testLineSearch3
	"Test line searh for the final step of Newton solver for equation
	
	F(x) := x + 1 for x = -1 (+ small epsilon)
	
	F'(x) = 1.
	
	This case does not require line search, should return 1.
	"
	| xOld eps p functionBlock g0 g1 dg0 lineSearch xAnswer |
	eps := DhbFloatingPointMachine new defaultNumericalPrecision.
	xOld := -1.0 + eps.
	p := eps.
	functionBlock := [  :t | 0.5 * ((t * p + xOld) + 1) squared ].
	g0 := functionBlock value: 0.
	g1 := functionBlock value: 1.
	dg0 := 2.0 * g0 negated.
	lineSearch := PMLineSearch function: functionBlock valueAtZero: g0 derivativeAtZero: dg0 valueAtOne: g1.
	lineSearch desiredPrecision: eps.
	xAnswer := lineSearch evaluate.
	self assert: xAnswer equals: 1.0.
	