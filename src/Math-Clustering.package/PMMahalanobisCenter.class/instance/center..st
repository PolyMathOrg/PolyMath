initialization
center: aVector

	accumulator := DhbCovarianceAccumulator new: aVector size.
	center := aVector.
	inverseCovariance := DhbSymmetricMatrix identity: aVector size
