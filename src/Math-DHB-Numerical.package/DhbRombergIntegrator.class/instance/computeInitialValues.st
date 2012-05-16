operation
computeInitialValues
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 26/4/99 "
	super computeInitialValues.
	points := OrderedCollection new: order.
	interpolator := DhbNevilleInterpolator points: points.
	points add: 1 @ sum.