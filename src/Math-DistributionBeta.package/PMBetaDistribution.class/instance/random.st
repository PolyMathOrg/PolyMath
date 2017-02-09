information
random
	"Answer a random number distributed according to the receiver."
	| r |
	r := self firstGammaDistribution random.
	^r / ( self secondGammaDistribution random + r)