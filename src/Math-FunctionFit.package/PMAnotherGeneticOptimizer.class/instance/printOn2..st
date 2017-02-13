printing
printOn2: aStream
	aStream
		nextPutAll: ' manager: ';
		print: chromosomeManager;
		nextPutAll: ' maxIterations: ';
		print: maximumIterations;
		nextPutAll: ' rangeScale: ';
		print: rangeScale;
		nextPutAll: ' removeLast: ';
		print: removeLast;
		nextPutAll: ' steadyState: ';
		print: steadyState;
		nextPutAll: ' statistics: ';
		print: statistics;
		nextPutAll: ' result: ';
		print: result;
		nextPut: $)