operation
evaluateIteration
	"Perform one iteration."

	| delta |
	delta := termServer termAt: iterations.
	result := result + delta.
	^ self precisionOf: delta abs relativeTo: result abs