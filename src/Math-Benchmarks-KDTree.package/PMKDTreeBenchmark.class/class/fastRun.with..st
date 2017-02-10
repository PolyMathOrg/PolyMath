benchmarking
fastRun: nIterations with: aSequentalCollectionClass
"omits the slow StupidNNSearch, that generally isnt interesting"
|b|
(b:=self new) 
	selectedBenchmarks: 
		{ #benchBuildTree1Dim. #benchBuildTree4Dim. #benchSearchTree1Dim. #benchSearchTree4Dim};
	collType: aSequentalCollectionClass .
^self defaultRunner execute: b with: nIterations. 
