iterative algorithms
testLineSearch1
	"Test line searh for an initial step of Newton solver for equation
	
	atan x = 0 with x0 = 2.
	
	D[atan x] = 1 / (1+x^2).
	"
	| xOld p functionBlock g0 g1 dg0 xAnswer |
	xOld := 2.0.
	p := (xOld arcTan * (1.0 + xOld squared)) negated.
	functionBlock := [  :x | 0.5 * ((x * p + xOld) arcTan) squared ].
	g0 := functionBlock value: 0.
	g1 := functionBlock value: 1.
	dg0 := 2.0 * g0 negated.
	xAnswer := (DhbLineSearch
					function: functionBlock
					valueAtZero: g0
					derivativeAtZero: dg0
					valueAtOne: g1) evaluate.
	self assert: (xAnswer <= 0.5) & (xAnswer > 1e-3).
	self assert: (functionBlock value: xAnswer) < g0.
	self assert: (functionBlock value: xAnswer) < g1.
	