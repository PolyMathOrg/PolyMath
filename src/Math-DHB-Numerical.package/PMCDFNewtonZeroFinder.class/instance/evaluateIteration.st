operation
evaluateIteration
		"fallback on bisection if necessary (no divideByZero anymore)"
	| delta new |
	delta :=( functionBlock value: result) / (derivativeBlock value: result).
	new := result - delta.
	old<result 
		ifTrue: [	new <= old ifTrue:[new:=old+result /2.0]]
		ifFalse:[	new>=old ifTrue: [new:=old+result /2.0]].
	[0.0 = (derivativeBlock value: new )] whileTrue: [new:=new +result /2.0].
	old:=result.
	result:=new.
	^self relativePrecision: delta abs