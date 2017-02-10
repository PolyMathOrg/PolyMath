as yet unclassified
runAll: numOfIterations
	^ ((self withAllSubclasses collect: [ :suite |
		suite run: numOfIterations]) do: [ :suiteResult | 
			suiteResult  results removeKey: #baseBenchmark ]) reject: [ :runner |
				runner results isEmpty ]