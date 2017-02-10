information
hasConverged
^equalityTest 
	ifNil: [(result literalEqual: result1) or: [result literalEqual: result2]]
	ifNotNil: [:t|(t value: result value: result1)or:[t value: result value: result2]]