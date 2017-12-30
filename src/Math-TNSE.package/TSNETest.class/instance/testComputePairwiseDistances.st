tests
testComputePairwiseDistances
	| t |
	t := (TSNE
		new)
		x: (PMMatrix rows: #(#(1 2) #(3 4))).
	self assert: t computePairwiseDistances equals: (PMMatrix rows: #(#(0 8) #(8 0)))