initialization
center: aVector
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/16/00 "
	accumulator := DhbCovarianceAccumulator new: aVector size.
	center := aVector.
	inverseCovariance := DhbSymmetricMatrix identity: aVector size.
	^self