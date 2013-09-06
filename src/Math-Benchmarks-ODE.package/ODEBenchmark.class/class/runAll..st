as yet unclassified
runAll: numOfIterations
	^ (self withAllSubclasses collect: [ :each | each run: numOfIterations ]) joinUsing: Character cr