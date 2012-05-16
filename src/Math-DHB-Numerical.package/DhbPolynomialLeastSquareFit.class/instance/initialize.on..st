initialization
initialize: anInteger on: aCollectionOfPoints
		"Private - Defines the collection of points for the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 18/3/99 "
	pointCollection := aCollectionOfPoints.
	degreePlusOne := anInteger + 1.
	^self