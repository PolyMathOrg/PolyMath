tests
testClusterEuclidean

	| clusters finder |
	finder := PMClusterFinder new: 5 server: dataServer type: PMEuclideanCluster.
	finder minimumRelativeClusterSize: 0.15.
	clusters := finder evaluate.
	self assert: clusters size equals: 3