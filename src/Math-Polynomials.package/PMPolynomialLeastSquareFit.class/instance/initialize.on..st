initialization
initialize: anInteger on: aCollectionOfPoints
		"Private - Defines the collection of points for the receiver."
	pointCollection := aCollectionOfPoints.
	degreePlusOne := anInteger + 1.
	^self