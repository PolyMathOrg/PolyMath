as yet unclassified
runAll: numOfIterations
	^ (self withAllSubclasses collect: [ :suite |
		suite run: numOfIterations ]) reject: [ :runner |
			runner results isEmpty ]