accessing
argument: anArgument
	arguments 
		at: self findKey 
		put: (anArgument ifNotNilDo: [:a| self asArray: a]).
	^ anArgument 
