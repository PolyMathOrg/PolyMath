tests
testInitialDimsSetByDefaultWithFifty
	| t |
	t := TSNE
		new
		x: (TSNE gridDataGeneratorOf: 10);
		run.
	self assert: t initialDims equals: 50