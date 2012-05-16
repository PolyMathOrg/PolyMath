transformation
add: aPoint weight: aNumber 
	"Accumulate aPoint into of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "

	sum1 := sum1 + aNumber.
	sumX := sumX + (aPoint x * aNumber).
	sumY := sumY + (aPoint y * aNumber).
	sumXX := sumXX + (aPoint x squared * aNumber).
	sumYY := sumYY + (aPoint y squared * aNumber).
	sumXY := sumXY + (aPoint x * aPoint y * aNumber).
	self resetResults