initialization
setValueAtZero: valueAtZero derivativeAtZero: derivativeAtZero valueAtOne: valueAtOne
	boundaryValues at: 1 put: valueAtZero asFloat.
	boundaryValues at: 2 put: derivativeAtZero asFloat.
	boundaryValues at: 3 put: valueAtOne.
	^ self