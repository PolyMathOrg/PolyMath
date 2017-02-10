accessing
argument: anArgument
	arguments
		at: self findKey
		put: (anArgument ifNotNil: [ :a | self asArray: a ]).
	^ anArgument