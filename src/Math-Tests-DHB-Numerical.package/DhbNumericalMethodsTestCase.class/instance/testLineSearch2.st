iterative algorithms
testLineSearch2
	"Test line searh for an initial step of Newton solver for equation
	
	F(x) := sqrt(x) - x = 0 with x = 2.
	
	F'(x) = 0.5 / sqrt(x) - 1.
	
	This case does not require line search, should return 1.
	"
	| xOld p functionBlock g0 g1 dg0 xAnswer |
	xOld := 2.0.
	p := ((xOld sqrt - xOld) / (0.5 / xOld sqrt - 1)) negated.
	functionBlock := [  :x | 0.5 * ((x * p + xOld) sqrt - (x * p + xOld)) squared ].
	g0 := functionBlock value: 0.
	g1 := functionBlock value: 1.
	dg0 := 2.0 * g0 negated.
	xAnswer := (DhbLineSearch
					function: functionBlock
					valueAtZero: g0
					derivativeAtZero: dg0
					valueAtOne: g1) evaluate.
	self assert: xAnswer equals: 1.0.
	self assert: (functionBlock value: xAnswer) < g0.
	self assert: (functionBlock value: xAnswer) = g1.
	