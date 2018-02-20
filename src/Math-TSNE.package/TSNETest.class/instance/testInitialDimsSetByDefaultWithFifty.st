tests
testInitialDimsSetByDefaultWithFifty
	| t |
	t := TSNE
		new
		x: (TSNE gridDataGeneratorOf: 5);
		start.
	self assert: t initialDims equals: 50