accessing
populationDistribution: aDistribution
	"utility, a simple alternative method to set cdf."

	popDistribution := aDistribution.
	popDistribution distributionValue: 0.95.	"just a test whether it understands #distributionValue:, to raise a dnu early enough because of this block:"
	compareWith := [ :x | popDistribution distributionValue: x ]