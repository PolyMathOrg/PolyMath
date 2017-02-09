information
confidenceLevel: aNumber
	"Answer the probability in percent of finding a chi square value distributed according to the receiver larger than aNumber."

	^ (1 - (self distributionValue: aNumber)) * 100