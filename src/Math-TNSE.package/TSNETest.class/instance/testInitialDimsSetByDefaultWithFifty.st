tests
testInitialDimsSetByDefaultWithFifty
	| t |
	t := TSNE
		new
		x: (TSNE gridDataGeneratorOf: 5);
		run.
	self assert: t initialDims equals: 50