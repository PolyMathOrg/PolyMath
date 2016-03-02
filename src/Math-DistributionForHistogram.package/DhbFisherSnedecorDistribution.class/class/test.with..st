creation
test: aStatisticalMoment1 with: aStatisticalMoment2 
	"Perform a consistency Fisher test (or F-test) on the variances of two statistical moments ( or histograms).	 Answer the probability of passing the test."

	^(self class degreeOfFreedom: aStatisticalMoment1 count
		degreeOfFreedom: aStatisticalMoment2 count) 
			distributionValue: aStatisticalMoment1 variance 
					/ aStatisticalMoment2 variance