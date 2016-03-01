initialization
initialize
	"Private - initialize the parameters of the receiver with default values."
	desiredPrecision := self class defaultPrecision.
	maximumIterations := self class defaultMaximumIterations.
	^self