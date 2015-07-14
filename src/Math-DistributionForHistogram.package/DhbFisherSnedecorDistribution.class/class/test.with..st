creation
test: aStatisticalMoment1 with: aStatisticalMoment2 
	"Perform a consistency Fisher test (or F-test) on the variances of two statistical moments ( or histograms).
		 Answer the probability of passing the test.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "

	^(self class degreeOfFreedom: aStatisticalMoment1 count
		degreeOfFreedom: aStatisticalMoment2 count) 
			distributionValue: aStatisticalMoment1 variance 
					/ aStatisticalMoment2 variance