creation
test: aStatisticalMoment1 with: aStatisticalMoment2
	"Perform a consistency Student test (or t-test) on the averages of  two statistical moments ( or histograms). Answers the probability of failing the test."
	| t |
	t := ( aStatisticalMoment1 average - aStatisticalMoment2 average) abs.
	^1 - ( ( self class degreeOfFreedom: (  aStatisticalMoment1 count + aStatisticalMoment2 count - 2)) acceptanceBetween: t negated and: t)