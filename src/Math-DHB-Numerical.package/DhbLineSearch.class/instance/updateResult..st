as yet unclassified
updateResult: nextX
	" Move x1 -> x2; g(x1) -> g(x2) and assign x1 = nextX; g(x1) = g(nextX) "
	extendedResult at: 3 put: (extendedResult at: 1).
	extendedResult at: 4 put: (extendedResult at: 2).
	extendedResult at: 1 put: nextX.
	extendedResult at: 2 put: (functionBlock value: nextX).
	result := nextX
	