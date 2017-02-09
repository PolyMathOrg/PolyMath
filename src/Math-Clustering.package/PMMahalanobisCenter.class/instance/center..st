initialization
center: aVector

	accumulator := PMCovarianceAccumulator new: aVector size.
	center := aVector.
	inverseCovariance := PMSymmetricMatrix identity: aVector size
