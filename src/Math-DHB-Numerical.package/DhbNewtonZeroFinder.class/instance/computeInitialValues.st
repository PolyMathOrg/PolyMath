operation
computeInitialValues
		"Private - If no derivative has been defined, take an ad-hoc definition.
		 If no initial value has been defined, take 0 as the starting point (for lack of anything better).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "
	| n |
	result isNil
		ifTrue: [ result := 0].
	derivativeBlock isNil
		ifTrue: [ derivativeBlock := self defaultDerivativeBlock].
	n := 0.
	[ (derivativeBlock value: result) equalsTo: 0]
		whileTrue: [ n := n + 1.
					 n > maximumIterations
						ifTrue: [ self error: 'Function''s derivative seems to be zero everywhere'].
					 result := Number random + result].