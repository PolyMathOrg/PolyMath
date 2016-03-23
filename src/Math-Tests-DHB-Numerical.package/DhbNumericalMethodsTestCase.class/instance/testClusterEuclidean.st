data mining
testClusterEuclidean

	| dataServer clusters finder |
	dataServer := DhbMemoryBasedDataServer new.
	dataServer data: ( self generatedPoints: 1000).
	finder := PMClusterFinder new: 5 server: dataServer type: PMEuclideanCluster.
	finder minimumRelativeClusterSize: 0.15.
	clusters := finder evaluate.
	self should: [ clusters size = 3].