operation
computeInitialValues
		"Private"
	super computeInitialValues.
	points := OrderedCollection new: order.
	interpolator := PMNevilleInterpolator points: points.
	points add: 1 @ sum