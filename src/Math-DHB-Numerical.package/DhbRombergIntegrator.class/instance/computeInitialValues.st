operation
computeInitialValues
		"Private"
	super computeInitialValues.
	points := OrderedCollection new: order.
	interpolator := DhbNevilleInterpolator points: points.
	points add: 1 @ sum