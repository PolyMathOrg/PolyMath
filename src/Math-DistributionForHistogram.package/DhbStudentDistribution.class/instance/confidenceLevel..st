information
confidenceLevel: aNumber
	"Answer the probability in percent of finding a value distributed according to the receiver with an absolute value larger than aNumber."
	^( 1 - ( self symmetricAcceptance: aNumber abs)) * 100