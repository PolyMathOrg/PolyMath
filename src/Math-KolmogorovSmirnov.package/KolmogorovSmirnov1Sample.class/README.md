does a two-sided Kolmogorov-Smirnow test and checks whether sample data are from a population with a given distribution. you have to set the data that can be any collection of numbers and the cumulative distribution function. you can do the last one in two ways, either  by specifying a block via #cdf: or by specifying a distribution with concrete parameters via #populationDistribution: .
#ksStatistic returns kolmogorovs D, calculated as the maximum of D+ and D- , iow it does not (!) use D = max( | F(y(i)) - i/n| ) . (see eg http://www.itl.nist.gov/div898/handbook/eda/section3/eda35g.htm  why this would be wrong.)
#pValue returns the probability of getting a D <= ksStatistic .
#rejectEqualityHypothesisWithAlpha: does what its name says of course.
example:
nd:= DhbNormalDistribution new."--> Normal distribution( 0, 1)"
ks :=KolmogorovSmirnov  compareData: ((1 to:100) collect:[:i|nd random]) withDistribution: nd."--> 
a KolmogorovSmirnov(dataSize: 100 cdf: distributionValue of Normal distribution( 0, 1))"
ks rejectEqualityHypothesisWithAlpha: 0.05."--> false"


