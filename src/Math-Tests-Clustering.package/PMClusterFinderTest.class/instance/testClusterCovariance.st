tests
testClusterCovariance

	| clusters finder |
	finder := PMClusterFinder new: 5 server: dataServer type: PMCovarianceCluster.
	finder minimumRelativeClusterSize: 0.1.
	clusters := finder evaluate.
	self assert: clusters size equals: 3