does a two-sided Kolmogorov-Smirnow test and checks whether two sample data are from the same population, which is assumed to be a continous distribution (iow  ties occur with probability zero ). 
#ksStatistic returns kolmogorovs D.
#pValue returns the probability of getting a D < ksStatistic .
#rejectEqualityHypothesisWithAlpha: does what its name says of course.
example:
nd:= DhbNormalDistribution new.
ks :=KolmogorovSmirnov2Sample  
	compareData: ((1 to:100) collect:[:i|nd random]) 
	withData: ((1 to:100) collect:[:i|nd random]). "-->
a KolmogorovSmirnov2Sample(dataSize: 100 otherDataSize: 100)"
k ksStatistic . "-->(9/100)"
k pValue asFloat ."-->0.18458528753386905"
ks rejectEqualityHypothesisWithAlpha: 0.05. "-->false"

the pValue is directly (no SmirnovDistribution implemented at the moment) and exactly calculated as explained in:
Kim, P. J. & Jennrich, R. I. 
'Tables of the exact sampling distribution of the two-sample Kolmogorov–Smirnov criterion...'
in 'Selected Tables in Mathematical Statistics Volume I' (1973).

no aproximation is at the moment used for bigger datasizes, hence calcs will be too slow in that case.