transformation
remove: aPoint 
	"Remove aPoint which was accumulated into of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "

	sum1 := sum1 - 1.
	sumX := sumX - aPoint x.
	sumY := sumY - aPoint y.
	sumXX := sumXX - aPoint x squared.
	sumYY := sumYY - aPoint y squared.
	sumXY := sumXY - (aPoint x * aPoint y).
	self resetResults