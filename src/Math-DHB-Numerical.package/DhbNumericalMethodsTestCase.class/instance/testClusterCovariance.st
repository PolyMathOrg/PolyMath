data mining
testClusterCovariance

	| dataServer clusters finder |

	dataServer := DhbMemoryBasedDataServer new.
	dataServer data: ( self generatedPoints: 1000).
	finder := DhbClusterFinder new: 5 server: dataServer type: DhbCovarianceCluster.
	finder minimumRelativeClusterSize: 0.1.
	clusters := finder evaluate.
	self should: [ clusters size = 3].