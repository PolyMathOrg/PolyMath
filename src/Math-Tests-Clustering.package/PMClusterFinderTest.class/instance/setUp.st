setUp
setUp


	dataServer := PMMemoryBasedDataServer new.
	dataServer data: (self generatedPoints: 1000).
	