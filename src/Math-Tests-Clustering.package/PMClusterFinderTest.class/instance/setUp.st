setUp
setUp


	dataServer := DhbMemoryBasedDataServer new.
	dataServer data: (self generatedPoints: 1000).
	