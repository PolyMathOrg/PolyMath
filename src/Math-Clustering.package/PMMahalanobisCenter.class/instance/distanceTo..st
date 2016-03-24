information
distanceTo: aVector

	| delta |
	delta := aVector - center.
	^ delta * inverseCovariance * delta