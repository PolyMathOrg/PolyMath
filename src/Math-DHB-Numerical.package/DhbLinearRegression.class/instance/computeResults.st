transformation
computeResults
	"Private - Compute the results of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "

	| xNorm xyNorm |
	xNorm := sumXX * sum1 - (sumX * sumX).
	xyNorm := sumXY * sum1 - (sumX * sumY).
	slope := xyNorm / xNorm.
	intercept := (sumXX * sumY - (sumXY * sumX)) / xNorm.
	correlationCoefficient := xyNorm 
				/ (xNorm * (sumYY * sum1 - (sumY * sumY))) sqrt